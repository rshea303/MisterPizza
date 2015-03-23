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
    user2 = User.create!(user_attributes(email: "user2@example.com"))
    category = Category.create!(name: "Pizza")
    category.items.create!(name: "Cheese Pizza",
                           price: "50000",
                           description: "really good",
                           image_file_name: "default image"
                          )
    visit "/"
    sign_in(user1)
    click_on("Pizza")
    2.times do
      click_on("Add To Cart")
    end
    expect(page).to have_text("Items in Cart: 2")
    click_on("Log Out")
    visit "/"
    sign_in(user2)
    expect(page).to have_text("Items in Cart: 0")
  end

  def sign_in(user)
    visit login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Submit"
  end
end
