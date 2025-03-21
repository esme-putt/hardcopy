class OrdersController < ApplicationController
    before_action :authenticate_user!, only: [:index]
    before_action :set_order, only: [:show]
    before_action :initialize_cart, only: [:new, :create]
    
    def index
      @orders = current_user.orders.order(created_at: :desc)
    end
    
    def show
      # Allow guest access with order token
      unless @order.user == current_user || current_user&.admin? || params[:token] == @order.token
        redirect_to root_path, alert: "You don't have permission to view this order."
      end
    end
    
    def new
      if session[:cart].empty?
        redirect_to cart_path, alert: "Your cart is empty. Please add items before checkout."
        return
      end
      
      @order = Order.new
      calculate_cart_totals
    end
    
    def create
      if session[:cart].empty?
        redirect_to cart_path, alert: "Your cart is empty. Please add items before checkout."
        return
      end
      
      calculate_cart_totals
      
      @order = Order.new(order_params)
      @order.user = current_user if user_signed_in?
      @order.status = 'pending'
      @order.total_amount = calculate_order_total
      @order.token = SecureRandom.hex(10) # Generate a unique token for guest order access
      
      # Combine address fields
      address_parts = [
        params[:order][:address_line1],
        params[:order][:address_line2],
        "#{params[:order][:city]}, #{params[:order][:state]} #{params[:order][:postal_code]}",
        params[:order][:country]
      ].reject(&:blank?)
      
      @order.address = address_parts.join(', ')
      
      if @order.save
        # Create order items from cart
        session[:cart].each do |product_id, quantity|
          product = Product.find_by(id: product_id)
          next unless product
          
          # Create order item
          @order.order_items.create(
            product: product,
            quantity: quantity,
            price: product.price
          )
          
          # Update product stock
          new_stock = product.stock - quantity
          product.update(stock: new_stock > 0 ? new_stock : 0)
        end
        
        # Clear the cart
        session[:cart] = {}
        
        # Set the token in the session for non-logged-in users
        session[:last_order_token] = @order.token unless user_signed_in?
        
        redirect_to order_path(@order, token: @order.token), notice: 'Your order was successfully placed!'
      else
        render :new
      end
    end
    
    private
    
    def set_order
      @order = Order.find(params[:id])
    end
    
    def order_params
      params.require(:order).permit(:email, :phone, :first_name, :last_name, :address_line1, :address_line2, :city, :state, :postal_code, :country, :shipping_method)
    end
    
    def initialize_cart
      session[:cart] ||= {}
    end
    
    def calculate_cart_totals
      @cart_items = []
      @cart_total = 0
      
      session[:cart].each do |product_id, quantity|
        product = Product.find_by(id: product_id)
        next unless product
        
        item_total = product.price * quantity
        @cart_items << {
          product: product,
          quantity: quantity,
          total: item_total
        }
        
        @cart_total += item_total
      end
    end
    
    def calculate_order_total
      subtotal = @cart_total
      shipping_cost = params[:order][:shipping_method] == 'express' ? 15.95 : (subtotal >= 75 ? 0 : 8.95)
      tax = subtotal * 0.07
      
      subtotal + shipping_cost + tax
    end
  end