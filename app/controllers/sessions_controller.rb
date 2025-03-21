class SessionsController < ApplicationController
    def new
      redirect_to root_path if current_user
    end
    
    def create
      user = User.find_by(email: params[:email].downcase)
      
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_back_or_default(root_path)
        flash[:notice] = 'Successfully logged in!'
      else
        flash.now[:alert] = 'Invalid email or password'
        render :new
      end
    end
    
    def destroy
      session[:user_id] = nil
      redirect_to root_path, notice: 'Successfully logged out!'
    end
  end