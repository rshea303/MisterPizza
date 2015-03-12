require "rails_helper"

describe "checkout" do

  before do
    category = Category.create(name: "pizza")
    category.items.create!(name: "cheese pizza", description: "yummy", price: 2500, image_file_name: "default")
  end

  context "an authenticated user" do

    before do
      user = User.create!(user_attributes)
      visit "/"
      click_link_or_button("Log In")
      fill_in "session[email]", with: user.email
      fill_in "session[password]", with: user.password
      click_link_or_button("Submit")
      click_link_or_button("pizza")
      5.times do
        click_link_or_button("Add To Cart")
      end
      click_link_or_button("Items in Cart")
    end

    it "can checkout" do
      click_link_or_button("Checkout")
      expect(page).to have_text("Thank you for your order!")
      expect(current_path).to eq(user_orders_path)
      expect(page).to have_text("Order history for: #{user.email}")
    end
  end
end
