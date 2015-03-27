require "rails_helper"

describe "order" do

  before do
    category = Category.create!(name: "pizza")
    category.items.create!(name: "item1", description: "item1desc", price: 5000, image_file_name: "defaultitem1")
  end

  it "can see individual order details" do
    user = User.create!(user_attributes)
    visit "/"
    sign_in(user)

    click_on("pizza")
    click_on("Add To Cart")
    click_on("Items in Cart")
    click_on("Checkout")

    click_on("Order Number: #{user.orders.first.id}")
    expect(page).to have_text("item1")
    expect(page).to have_text("Order Details")
  end

  it "cannot view other user orders" do
    user = User.create!(user_attributes)
    visit "/"
    sign_in(user)

    click_on("pizza")
    click_on("Add To Cart")
    click_on("Items in Cart")
    click_on("Checkout")
    click_on("Log Out")
    user2 = User.create!(user_attributes(email: "user2@example.com"))
    visit "/"
    sign_in(user2)

    visit user_orders_path(user)
    expect(page).to have_text("You are not authorized to access this page")
  end
  
end
