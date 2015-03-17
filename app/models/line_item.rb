class LineItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :order
  
  def item_name(item_id)
    item = Item.find(item_id)
    item.name    
  end

  def price(item_id)
    item = Item.find(item_id)
    price = item.price
    price / 100
  end
  
  def subtotal(item_id, quantity)
    item = Item.find(item_id)
    (item.price / 100) * quantity
  end

end
