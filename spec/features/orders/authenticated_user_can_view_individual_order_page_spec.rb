require "rails_helper"

describe "order" do

  before do
    @category = Category.create!(name: "pizza")
    @category.items.create!(name: "item1", description: "item1desc", price: 5000, image_file_name: "defaultitem1")
    @user = User.create!(user_attributes)
    visit "/"
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    
    click_link_or_button("pizza")
    5.times do
      click_link_or_button("Add To Cart")
    end
    click_link_or_button("Items in Cart")
    click_link_or_button("Checkout")
  end

  it "can see individual order details" do
    click_link_or_button("Order Number: #{@user.orders.first.id}")
    expect(page).to have_text("item1")
    expect(page).to have_text("Order Details")
  end

  it "cannot view other user orders" do
    @user2 = User.create!(user_attributes)
    visit user_orders_path(@user2)

    expect(page).to have_text("You are not authorized to access this page")
  end
end
