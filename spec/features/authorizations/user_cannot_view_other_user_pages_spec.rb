require "rails_helper"

describe "users" do

  before do
    @category = Category.create!(name: "pizza")
    @category.items.create!(name: "item1", description: "item1desc", price: 5000, image_file_name: "default")
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

    visit user_orders_path(@user) 
    #flash alert
    expect(page).to have_text("Unauthorized access!")
    #redirect to homepage
    expect(current_path).to eq(root_path)
  end
end
