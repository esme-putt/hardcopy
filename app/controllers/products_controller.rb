class ProductsController < ApplicationController
    before_action :set_product, only: [:show]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    before_action :ensure_admin, only: [:new, :create, :edit, :update, :destroy]
    
    def index
      @products = Product.all.order(created_at: :desc)
      
      # If using pagination
      if Product.respond_to?(:page)
        @products = @products.page(params[:page]).per(12)
      else
        @products = @products.limit(12)
      end
    end
    
    def show
    end
    
    def new
      @product = Product.new
    end
    
    def create
      @product = Product.new(product_params)
      
      if @product.save
        redirect_to @product, notice: 'Product was successfully created.'
      else
        render :new
      end
    end
    
    def edit
    end
    
    def update
      if @product.update(product_params)
        redirect_to @product, notice: 'Product was successfully updated.'
      else
        render :edit
      end
    end
    
    def destroy
      @product.destroy
      redirect_to products_url, notice: 'Product was successfully destroyed.'
    end
    
    private
    
    def set_product
      @product = Product.find(params[:id])
    end
    
    def product_params
      params.require(:product).permit(:title, :price, :description, :stock, :featured, :specifications, :condition, :original_price, images: [])
    end
    
    def ensure_admin
      redirect_to root_path unless current_user && current_user.admin?
    end
  end