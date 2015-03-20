require "rails_helper"

describe "order" do
  include Capybara::DSL

  it "has total price" do
    @user = User.create!(user_attributes)
    category = Category.create!(name: "New Category")
    category.items.create(item_attributes)
    category.items.create(item_attributes(price: 2000))
    category.items.create(item_attributes(price: 3000))
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit "/"
    click_link_or_button("New Category")

    within(".item") do
      2.times do
        first(:button, "Add To Cart").click
      end
    end
    
    click_link_or_button("Items in Cart")
    click_link_or_button("Checkout")
    click_link_or_button("Order Number: #{@user.orders.last.id}")
    expect(page).to have_text("$25") 
  end
end
