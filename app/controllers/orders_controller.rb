class OrdersController < ApplicationController
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
end
