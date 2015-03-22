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
    sign_in(user)
    click_on("Pizza")
    click_on("Add To Cart")
    click_on("Items in Cart:")

    expect(page).to have_text("Cheese Pizza")
    expect(page).to have_text("1")
    expect(page).to have_text("$500")
    expect(page).to have_text("Cart Details")
  end

  def sign_in(user)
    visit login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Submit"
  end

end 
