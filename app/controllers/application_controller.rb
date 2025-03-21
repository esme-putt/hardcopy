class ApplicationController < ActionController::Base
  helper_method :current_user, :user_signed_in?
  
  private
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  
  def user_signed_in?
    current_user.present?
  end
  
  def authenticate_user!
    unless user_signed_in?
      # Store the current URL to redirect back after login
      session[:return_to] = request.original_fullpath
      redirect_to login_path, alert: "Please log in to access this page."
    end
  end
  
  def ensure_admin
    unless current_user&.admin?
      redirect_to root_path, alert: "You don't have permission to access this page."
    end
  end
  
  # Used to redirect back to the page the user was trying to access before login
  def redirect_back_or_default(default = root_path)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end
end