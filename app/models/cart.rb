class Cart < ActiveRecord::Base
  attr_reader :data

  def initialize(cart_data)
    @data = cart_data || {}
  end

  def add_item(item_id)
    @data[item_id] ||= 0
    @data[item_id] += 1
  end

  def increase_quantity(item_id)
    @data[item_id] += 1
  end

end
