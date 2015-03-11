require 'rails_helper'

describe "an unauthenticated user" do

  it "can view an individual item" do
    category = Category.create!(name: "Pizza")
    category.items.create!(name: "Pepperoni Pizza", price: "1000", description: "this is a pepperoni pizza", image_file_name: "image")
 
    visit "/"
    click_link_or_button("Pizza")
    click_link_or_button("Pepperoni Pizza")
    expect(current_path).to eq(item_path(category.items.first))
    expect(page).to have_text("this is a pepperoni pizza")
    expect(page).to have_text("Pepperoni Pizza")
  end
end
