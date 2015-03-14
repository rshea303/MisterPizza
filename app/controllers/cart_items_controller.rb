class CartItemsController < ApplicationController

  def create
    @cart.add_item(params[:item_id])
    session[:cart] = @cart.data
    redirect_to :back
  end

  def index
    @cart_items = session[:cart]
    @categories = Category.all
  end

  def destroy
    session[:cart].delete(params[:id])
    redirect_to cart_items_path
  end
end
