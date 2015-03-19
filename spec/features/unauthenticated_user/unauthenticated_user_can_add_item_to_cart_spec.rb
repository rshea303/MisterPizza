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

  it "can add multiple items to cart" do
    category = Category.create!(name: "Pizza")
    category.items.create!(name: "Pizza",
                           price: "50000",
                           description: "really good",
                           image_file_name: "default image"
                          )
    visit "/"
    click_link_or_button("Pizza")
    2.times do
      click_link_or_button("Add To Cart")
    end
    expect(page).to have_text("Items in Cart: 2")

  end

  xit "can login and see stored cart" do
    user1 = User.create!(user_attributes)
    user2 = User.create!(user_attributes(email: "user2@example.com"))
    category = Category.create!(name: "Pizza")
    category.items.create!(name: "Cheese Pizza",
                           price: "50000",
                           description: "really good",
                           image_file_name: "default image"
                          )
    visit "/"
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user2)
    click_link_or_button("Pizza")
    2.times do
      click_link_or_button("Add To Cart")
    end
    expect(page).to have_text("Items in Cart: 2")
    click_link_or_button("Log Out")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
    visit "/"
    expect(page).to have_text("Items in Cart: 0")
  end

end
