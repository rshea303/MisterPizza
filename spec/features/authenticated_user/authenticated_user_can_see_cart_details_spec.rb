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
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit "/"
    click_link_or_button("Pizza")
    click_link_or_button("Add To Cart")
    click_link_or_button("Items in Cart:")

    expect(page).to have_text("Cheese Pizza")
    expect(page).to have_text("1")
    expect(page).to have_text("$500")
    expect(page).to have_text("Cart Details")
  end
end 
