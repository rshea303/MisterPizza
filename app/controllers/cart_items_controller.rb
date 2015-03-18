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
    if params[:format] == "1"
      @cart.increase_quantity(params[:id])
      session[:cart] = @cart.data
    elsif
      @cart.decrease_quantity(params[:id])
      if @cart.data[params[:id]] == 0
        session[:cart].delete(params[:id])
      end
      session[:cart] = @cart.data
    end
    redirect_to :back
  end

  def destroy
    session[:cart].delete(params[:id])
    redirect_to cart_items_path
  end

end
