class Admin::DashboardController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_admin
    
    def index
      @total_products = Product.count
      @products_in_stock = Product.where('stock > 0').count
      @total_orders = Order.count
      @pending_orders = Order.where(status: 'pending').count
      @total_subscribers = Subscriber.count
      @total_posts = Post.count
      
      @recent_orders = Order.order(created_at: :desc).limit(5)
      @low_stock_products = Product.where('stock <= 5 AND stock > 0').order(:stock).limit(5)
    end
  end