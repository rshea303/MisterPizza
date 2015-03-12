class OrdersController < ApplicationController
  def index
    flash[:notice] = "Thank you for your order!"
    @orders = Order.all
    @categories = Category.all
  end
end
