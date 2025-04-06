class Admin::PostsController < Admin::BaseController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    
    def index
      @posts = Post.all.order(created_at: :desc)
    end
    
    def show
    end
    
    def new
      @post = Post.new
    end
    
    def create
      @post = Post.new(post_params)
      
      if @post.save
        redirect_to admin_post_path(@post), notice: 'Post was successfully created.'
      else
        render :new
      end
    end
    
    def edit
    end
    
    def update
      if @post.update(post_params)
        redirect_to admin_post_path(@post), notice: 'Post was successfully updated.'
      else
        render :edit
      end
    end
    
    def destroy
      @post.destroy
      redirect_to admin_posts_path, notice: 'Post was successfully deleted.'
    end
    
    private
    
    def set_post
      @post = Post.find(params[:id])
    end
    
    def post_params
      params.require(:post).permit(:title, :content, :published, :published_at, :featured_image)
    end
  end