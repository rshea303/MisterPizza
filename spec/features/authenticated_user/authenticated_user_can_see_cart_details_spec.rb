require "rails_helper"

describe "an authenticated user" do

  it "can view cart" do
    user = User.create!(user_attributes)
    category = Category.create!(name: "Pizza")
    category.items.create!(name: "Cheese Pizza",
                           price: "50000",
                           description: "really good",
                           image_file_name: "default image"
                          )
    visit "/"
    click_link_or_button("Log In")
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    click_link_or_button("Submit")
    click_link_or_button("Pizza")
    2.times do
      click_link_or_button("Add To Cart")
    end
    click_link_or_button("Items in Cart:")
    expect(page).to have_text("Cheese Pizza")
    expect(page).to have_text("2")
    expect(page).to have_text("$500")
    expect(page).to have_text("Cart Details")
  end
end 
