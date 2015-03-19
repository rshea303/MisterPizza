class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
  
  def load_cart
    @cart ||= Cart.new(session[:cart])
  end
  
  before_action :load_cart

  def cart
    @cart.data
  end

  helper_method :cart

  def categories
    Category.all
  end

  helper_method :categories

  def require_log_in
    unless current_user
      redirect_to login_path, alert: "Please log in first." 
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: "You are not authorized to access this page"
  end

end
