require "rails_helper"

describe "checkout" do
  context "an authenticated user" do
    it "can checkout" do
      category = Category.create(name: "pizza")
      category.items.create!(name: "cheese pizza", description: "yummy", price: 2500, image_file_name: "default")

      user = User.create!(user_attributes)
      sign_in(user)
      visit "/"
      click_link_or_button("pizza")
      5.times do
        click_link_or_button("Add To Cart")
      end

      click_link_or_button("Items in Cart")
      expect(user.orders.count).to eq(0)
      click_link_or_button("Checkout")
      expect(user.orders.count).to eq(1)
      expect(user.orders.first.line_items.first.quantity).to eq(5)
      expect(user.orders.first.items.first.name).to eq("cheese pizza")
      
      expect(page).to have_text("Thank you for your order!")
      expect(current_path).to eq(user_orders_path(user))
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
