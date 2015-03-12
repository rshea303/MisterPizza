require "rails_helper"

describe "an unauthenticated user" do

  it "can remove item from cart" do
    category = Category.create!(name: "pizza")
    category.items.create!(name: "Cheese Pizza", description: "yummy", price: 2000, image_file_name: "default")

    visit "/"
    click_link_or_button("pizza")
    expect(current_path).to eq(category_path(category))
    5.times do
      click_link_or_button("Add To Cart")
    end
    expect(page).to have_text("5")
    click_link_or_button("Items in Cart")
    click_link_or_button("Remove From Cart")
    expect(page).to have_text("Items in Cart: 0")
  end
end
