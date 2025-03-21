class PagesController < ApplicationController
    def home
      @featured_products = Product.featured.limit(4)
      @recent_posts = Post.published.recent.limit(3)
    end
    
    def about
    end
  end