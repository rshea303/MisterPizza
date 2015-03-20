class Cart < ActiveRecord::Base
  attr_reader :data

  def initialize(cart_data)
    @data = cart_data || {}
  end

  def add_item(item_id)
    @data[item_id] ||= 0
    @data[item_id] += 1
  end

  def update_item_count(session_cart, item_id, params_format)
    @cart = Cart.new(session_cart)
    if params_format == "1"
      @cart.increase_quantity(item_id)
      session_cart = @cart.data
    elsif 
      @cart.decrease_quantity(item_id)
        if @cart.data[item_id] == 0
          session_cart.delete(item_id)
        end
      session_cart = @cart.data
    end
  end

  def increase_quantity(item_id)
    @data[item_id] += 1
  end

  def decrease_quantity(item_id)
    @data[item_id] -= 1
  end

  def total_price
    data.map do |id, quantity|
      Item.find(id).price * quantity
    end.reduce(0, :+)/100
  end

end
