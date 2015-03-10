require "rails_helper"

describe "an unauthenticated user" do

  it "can view category pages" do
    user = User.create!(user_attributes)
    category = Category.create!(name: "Pizza")
    category.items.create!(name: "Pepperoni Pizza", price: "1000", description: "this is a pepperoni pizza", image_file_name: "image")
    category.items.create!(name: "Cheese Pizza", price: "1100", description: "this is a cheese pizza", image_file_name: "image")
    category.items.create!(name: "Hawaiian Pizza", price: "1200", description: "this is a hawaiian pizza", image_file_name: "image")
    category.items.create!(name: "Vegetarian Pizza", price: "1300", description: "this is a vegetarian pizza", image_file_name: "image")
    category.items.create!(name: "Everything Pizza", price: "1400", description: "this is an everything pizza", image_file_name: "image")

    visit "/"
    click_link_or_button("Pizza")

    expect(current_path).to eq(category_path(category))
    expect(page).to have_text("Pepperoni Pizza")
    expect(page).to have_text("Everything Pizza")
    
    expect(page).to have_text("this is a pepperoni pizza")
    expect(page).to have_text("this is an everything pizza")

    expect(page).to have_text("$10")
    expect(page).to have_text("$14")
  end
end
