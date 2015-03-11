require "rails_helper"

describe "an unauthenticated user" do

  it "can add item to cart" do
    category = Category.create!(name: "Pizza")
    category.items.create!(name: "Pizza",
                           price: "50000",
                           description: "really good",
                           image_file_name: "default image"
                          )

    visit "/"
    click_link_or_button("Pizza")
    click_link_or_button("Add To Cart")
    expect(page).to have_text("Items in Cart: 1")
  end

end
