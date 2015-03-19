require "rails_helper"

describe "an item" do

  it "has a link to each show page" do
    category = Category.create!(name: "New Category")
    category.items.create!(name: "new item", description: "desc", price: 1111, image_file_name: "default")
    @user = User.create!(user_attributes)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit "/"
    click_link_or_button("New Category")
    click_link_or_button("Add To Cart")
    click_link_or_button("Items in Cart")
    click_link_or_button("Checkout")
    click_link_or_button("Order Number: #{@user.orders.first.id}")
    click_link_or_button("new item")
    expect(current_path).to eq(item_path(category.items.first.id))
  end
end
