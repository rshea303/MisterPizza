class CartItemsController < ApplicationController

  def create
    @cart.add_item(params[:item_id])
    session[:cart] = @cart.data
    redirect_to :back
  end

  def index
    @cart = session[:cart] 
  end
  
  def update
    @cart.update_item_count(session[:cart], params[:id], params[:format])
    redirect_to :back
  end

  def destroy
    session[:cart].delete(params[:id])
    redirect_to cart_items_path
  end

end
