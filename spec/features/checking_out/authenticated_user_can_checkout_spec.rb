require "rails_helper"

describe "checkout" do
  context "an authenticated user" do
    it "can checkout" do
      category = Category.create(name: "pizza")
      category.items.create!(name: "cheese pizza", description: "yummy", price: 2500, image_file_name: "default")

      user = User.create!(user_attributes)
      sign_in(user)
      visit "/"
      click_on("pizza")
      5.times do
        click_on("Add To Cart")
      end

      click_on("Items in Cart")
      click_on("Checkout")
      expect(current_path).to eq(user_orders_path(user))
      expect(page).to have_text("Thank you for your order!")
      expect(user.orders.count).to eq(1)
      expect(page).to have_text("Order history for: #{user.email}")
      expect(page).to have_text("Order Number: #{user.orders.first.id}")
    end

    def sign_in(user)
      visit login_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_on "Submit"
    end
  end
end
