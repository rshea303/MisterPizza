require "rails_helper"

describe "an item" do

  it "has a link to each show page" do
    category = Category.create!(name: "New Category")
    category.items.create!(name: "new item", description: "desc", price: 1111, image_file_name: "default")
    user = User.create!(user_attributes)
    visit "/"
    sign_in(user)
    
    click_on("New Category")
    click_on("Add To Cart")
    click_on("Items in Cart")
    click_on("Checkout")
    click_on("Order Number: #{user.orders.first.id}")
    click_on("new item")
    expect(current_path).to eq(item_path(category.items.first.id))
  end

end
