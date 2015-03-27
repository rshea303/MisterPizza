require "rails_helper"

describe "users" do


  it "cannot view other user pages" do
    category = Category.create!(name: "pizza")
    category.items.create!(name: "item1", description: "item1desc", price: 5000, image_file_name: "default")
    user = User.create!(user_attributes)

    visit "/"
    sign_in(user)

    click_on('pizza')

    10.times do
      click_on('Add To Cart')
    end

    click_on("Items in Cart")
    visit cart_items_path
    click_on("Checkout")

    user2 = User.create(user_attributes(email: "user2@example.com"))
    sign_in(user2)

    visit user_orders_path(user) 
    expect(page).to have_text("You are not authorized to access this page")
    expect(current_path).to eq(root_path)
  end

end
