class CartItemsController < ApplicationController
  def create
    cart_data = session[:cart] || {}
    item_id = params[:item_id]
    cart_data[item_id] ||= 0
    cart_data[item_id] += 1

    session[:cart] = cart_data

    redirect_to :back 
  end
end
