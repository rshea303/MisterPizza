class LineItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :order
  
  def item_name(item_id)
    item = Item.find(item_id)
    item.name    
  end
end
