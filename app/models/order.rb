class Order < ActiveRecord::Base
  belongs_to :user

  has_many :line_items, dependent: :destroy
  has_many :items, through: :line_items, dependent: :destroy
  
  def create_line_items(cart_info)
    cart_info.map do |item_id, quantity|
      LineItem.create(item_id: item_id, quantity: quantity)
    end
  end

  def total_price
    line_items.map do |line_item|
      Item.find(line_item.item_id).price * line_item.quantity
    end.reduce(0, :+)/100
  end
end
