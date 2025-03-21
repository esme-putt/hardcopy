class UsersController < ApplicationController
    def new
      redirect_to root_path if current_user
      @user = User.new
    end
    
    def create
      @user = User.new(user_params)
      @user.email = @user.email.downcase
      @user.role = 'customer'
      
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path, notice: 'Account created successfully!'
      else
        render :new
      end
    end
    
    private
    
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end