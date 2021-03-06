require "rails_helper"

describe "an unauthenticated user" do
  include Capybara::DSL

  it "can add item to cart" do
    category = Category.create!(name: "Pizza")
    category.items.create!(name: "Pizza",
                           price: "50000",
                           description: "really good",
                           image_file_name: "default image"
                          )

    visit "/"
    click_on("Pizza")
    click_on("Add To Cart")
    expect(page).to have_text("Items in Cart: 1")
  end

  it "can add multiple items to cart" do
    category = Category.create!(name: "Pizza")
    category.items.create!(name: "Pizza",
                           price: "50000",
                           description: "really good",
                           image_file_name: "default image"
                          )
    visit "/"
    click_on("Pizza")
    2.times do
      click_on("Add To Cart")
    end
    expect(page).to have_text("Items in Cart: 2")

  end

  it "can login and see stored cart" do
    user1 = User.create!(user_attributes)
    category = Category.create!(name: "Pizza")
    category.items.create!(name: "Cheese Pizza",
                           price: "50000",
                           description: "really good",
                           image_file_name: "default image"
                          )
    visit "/"
    click_on("Pizza")
    2.times do
      click_on("Add To Cart")
    end
    expect(page).to have_text("Items in Cart: 2")
    sign_in(user1)
    expect(page).to have_text("Items in Cart: 2")
  end

end
