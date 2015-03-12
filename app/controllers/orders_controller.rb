class OrdersController < ApplicationController
  def index
    flash[:notice] = "Thank you for your order!"
    @user = User.find(params[:user_id])
    @orders = Order.all
    @categories = Category.all
  end

  def create
    redirect_to user_orders_path(current_user.id)
  end
end
