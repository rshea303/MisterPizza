class OrdersController < ApplicationController
  before_action :require_log_in
  before_action :require_correct_user
  
  def index
    flash[:notice] = "Thank you for your order!"
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(user_id: params[:user_id])
    new_line_items = @order.create_line_items(session[:cart])
    @order.line_items << new_line_items
    @order.save
    @cart.data.clear
    redirect_to user_orders_path(params[:user_id])
  end
 
private

  def require_correct_user
    # This works, but it'd be better to...
    # Look into CanCan
    # Or Roll your own authorization
    unless current_user.id == params[:user_id].to_i
      flash[:alert] = "Unauthorized access!"
      redirect_to root_path
    end
  end

 
end
