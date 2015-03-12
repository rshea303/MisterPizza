class OrdersController < ApplicationController
  def index
    fail
    @orders = Order.all
  end
end
