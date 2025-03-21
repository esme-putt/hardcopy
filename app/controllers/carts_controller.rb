class CartsController < ApplicationController
    before_action :initialize_cart
    
    def show
      @cart_items = []
      @total = 0
      
      session[:cart].each do |product_id, quantity|
        product = Product.find_by(id: product_id)
        next unless product
        
        item_total = product.price * quantity
        @cart_items << {
          product: product,
          quantity: quantity,
          total: item_total
        }
        
        @total += item_total
      end
    end
    
    def add
      product_id = params[:id]
      quantity = params[:quantity].to_i || 1
      
      # Find the product to make sure it exists and is available
      product = Product.find_by(id: product_id)
      
      if product && product.stock >= quantity
        session[:cart][product_id] = (session[:cart][product_id] || 0) + quantity
        redirect_back(fallback_location: products_path, notice: "#{product.title} added to your cart.")
      else
        redirect_back(fallback_location: products_path, alert: "Sorry, this product is not available in the requested quantity.")
      end
    end
    
    def remove
      product_id = params[:id]
      session[:cart].delete(product_id)
      
      redirect_to cart_path, notice: "Item removed from your cart."
    end
    
    def update
      product_id = params[:product_id]
      quantity = params[:quantity].to_i
      
      if quantity <= 0
        session[:cart].delete(product_id)
      else
        product = Product.find_by(id: product_id)
        
        if product && product.stock >= quantity
          session[:cart][product_id] = quantity
        else
          flash[:alert] = "Sorry, only #{product.stock} items available."
          session[:cart][product_id] = product.stock
        end
      end
      
      redirect_to cart_path
    end
    
    def destroy
      session[:cart] = {}
      redirect_to cart_path, notice: "Your cart has been cleared."
    end
    
    private
    
    def initialize_cart
      session[:cart] ||= {}
    end
  end