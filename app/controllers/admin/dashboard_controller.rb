class Admin::DashboardController < Admin::BaseController
    def index
      @product_count = Product.count
      @products_in_stock = Product.where('stock > 0').count
      @post_count = Post.count
      @published_posts = Post.where(published: true).count
      @order_count = Order.count rescue 0
      @pending_orders = Order.where(status: 'pending').count rescue 0
      @user_count = User.count
      @admin_count = User.where(role: 'admin').count
      @subscriber_count = Subscriber.count
      @active_subscribers = Subscriber.where(active: true).count
    end
  end