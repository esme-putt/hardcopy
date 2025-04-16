class SubscribersController < ApplicationController
    def new
      @subscriber = Subscriber.new
    end
    
    def create
      @subscriber = Subscriber.new(subscriber_params)
      @subscriber.active = true
      
      # Check if the user is signed in
      if user_signed_in?
        @subscriber.user = current_user
      end
      
      # Check if subscriber with this email already exists
      existing_subscriber = Subscriber.find_by(email: @subscriber.email)
      
      if existing_subscriber
        if existing_subscriber.active
          redirect_to root_path, notice: 'You are already subscribed to our newsletter!'
        else
          existing_subscriber.update(active: true)
          redirect_to root_path, notice: 'Your subscription has been reactivated!'
        end
      elsif @subscriber.save
        # If not logged in, prompt to create an account
        if !user_signed_in?
          redirect_to root_path, notice: 'Thank you for subscribing to our newsletter!'
        else
          redirect_to root_path, notice: 'Thank you for subscribing to our newsletter!'
        end
      else
        render :new
      end
    end
    
    def unsubscribe
      # Find subscriber by email and token for security
      @subscriber = Subscriber.find_by(email: params[:email], token: params[:token])
      
      if @subscriber
        @subscriber.update(active: false)
        redirect_to root_path, notice: 'You have been unsubscribed from our newsletter.'
      else
        redirect_to root_path, alert: 'Invalid unsubscribe link.'
      end
    end
    
    private
    
    def subscriber_params
      params.require(:subscriber).permit(:name, :email)
    end
  end