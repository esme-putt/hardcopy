class PostsController < ApplicationController
    before_action :set_post, only: [:show]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :create_comment]
    before_action :ensure_admin, only: [:new, :create, :edit, :update, :destroy]
    
    def index
      @posts = Post.published.recent
      
      # Check if pagination is available
      if Post.respond_to?(:page)
        @posts = @posts.page(params[:page]).per(10)
      else
        # If pagination isn't available, limit results manually
        @posts = @posts.limit(10)
      end
    end
    
    def show
      @comment = Comment.new
      @comments = @post.comments.order(created_at: :desc)
    end
    
    def new
      @post = Post.new
    end
    
    def create
      @post = Post.new(post_params)
      
      if @post.save
        redirect_to @post, notice: 'Post was successfully created.'
      else
        render :new
      end
    end
    
    def edit
    end
    
    def update
      if @post.update(post_params)
        redirect_to @post, notice: 'Post was successfully updated.'
      else
        render :edit
      end
    end
    
    def destroy
      @post.destroy
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
    end
    
    def create_comment
      @post = Post.find(params[:post_id])
      @comment = @post.comments.new(comment_params)
      @comment.user = current_user
      
      if @comment.save
        redirect_to @post, notice: 'Comment was successfully added.'
      else
        @comments = @post.comments.order(created_at: :desc)
        render :show
      end
    end
    
    private
    
    def set_post
      @post = Post.find(params[:id])
    end
    
    def post_params
      params.require(:post).permit(:title, :content, :published, :published_at, :featured_image)
    end
    
    def comment_params
      params.require(:comment).permit(:content)
    end
    
    def ensure_admin
      redirect_to root_path unless current_user && current_user.admin?
    end
  end