class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @categories = Category.all
  end
end
