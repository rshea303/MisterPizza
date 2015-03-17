require "rails_helper"

describe "users" do

  before do
    @category = Category.create!(name: "pizza")
    @category2 = Category.create!(name: "beverages")
    @category.items.create!(name: "item1", description: "item1desc", price: 5000, image_file_name: "defaultitem1")
    @category2.items.create!(name: "item2", description: "item2desc", price: 5000, image_file_name: "defaultitem2")
    @user = User.create!(user_attributes)
    visit "/"
    click_link_or_button("Log In")
    fill_in "session[email]", with: @user.email
    fill_in "session[password]", with: @user.password
    click_link_or_button("Submit")
    
    click_link_or_button("pizza")
    5.times do
      click_link_or_button("Add To Cart")
    end
    click_link_or_button("Items in Cart")
    click_link_or_button("Checkout")
  end

  it "cannot view other users pages" do
    click_link_or_button("Log Out")
    @user2 = User.create(user_attributes(email: "user2@example.com"))
    click_link_or_button("Log In")
    fill_in "session[email]", with: @user2.email
    fill_in "session[password]", with: @user2.password
    click_link_or_button("Submit")
    visit "/users/1/orders" 
    expect(page).to have_text("Unauthorized access!")
    expect(current_path).to eq(root_path)
  end
end
