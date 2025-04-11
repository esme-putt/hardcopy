class Admin::ProductsController < Admin::BaseController
    before_action :set_product, only: [:show, :edit, :update, :destroy]
    
    def index
      @products = Product.all.order(created_at: :desc)
    end
    
    def show
      @product = Product.find(params[:id])
    end
    
    def new
      @product = Product.new
    end
    
    def create
      @product = Product.new(product_params)
      
      if @product.save
        redirect_to admin_product_path(@product), notice: 'Product was successfully created.'
      else
        render :new
      end
    end
    
    def edit
    end
    
    def update
      if @product.update(product_params)
        # Handle image reordering if image_order parameter is present
        if params[:product][:image_order].present?
          reorder_images(params[:product][:image_order])
        end
        
        # Handle image removal if removed_image_ids parameter is present
        if params[:product][:removed_image_ids].present?
          remove_images(params[:product][:removed_image_ids])
        end
        
        redirect_to admin_product_path(@product), notice: 'Product was successfully updated.'
      else
        render :edit
      end
    end
    
    def destroy
      @product.destroy
      redirect_to admin_products_path, notice: 'Product was successfully deleted.'
    end
    
    private
    
    def set_product
      @product = Product.find(params[:id])
    end
    
    def product_params
      params.require(:product).permit(:title, :price, :stock, :featured, :description, :condition, :original_price, images: [])
    end
    
    # Reorder attached images based on the provided order
    def reorder_images(image_order)
      image_ids = image_order.split(',')
      return if image_ids.empty?
      
      # Reorder images based on the provided order
      image_ids.each_with_index do |id, index|
        image = @product.images.find_by(id: id)
        if image
          image.update(position: index + 1)
        end
      end
    end
    
    # Remove images by their IDs
    def remove_images(image_ids)
      Array(image_ids).each do |id|
        image = @product.images.find_by(id: id)
        image&.purge
      end
    end
  end