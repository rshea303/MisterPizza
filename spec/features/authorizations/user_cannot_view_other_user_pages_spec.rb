require "rails_helper"

describe "users" do

  before do
    @category = Category.create!(name: "pizza")
    @category.items.create!(name: "item1", description: "item1desc", price: 5000, image_file_name: "default")
    @user = User.create!(user_attributes)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    
    @cart = Cart.new({"1" => 5})
    allow_any_instance_of(ApplicationController).to receive(:cart).and_return(@cart)
    visit "/"
    
    # how do I stub this out???
    click_link_or_button('pizza')
    10.times do
      click_link_or_button('Add To Cart')
    end
    click_link_or_button("Items in Cart")
    click_link_or_button("Checkout")
  end

  it "cannot view other users pages" do
    @user2 = User.create(user_attributes(email: "user2@example.com"))
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)

    visit user_orders_path(@user) 
    expect(page).to have_text("Unauthorized access!")
    save_and_open_page
    expect(current_path).to eq(root_path)
  end
end
