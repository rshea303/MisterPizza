require "rails_helper"

describe "user" do
  
  before do
      @category = Category.create(name: "pizza")
      @category.items.create!(name: "cheese pizza", description: "yummy", price: 2500, image_file_name: "default")
      @user = User.create!(user_attributes)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      
    visit "/"
    
    click_link_or_button("pizza")
    2.times do
      click_link_or_button("Add To Cart")
    end
    click_link_or_button("Items in Cart")
  end

  it "can increase quantity of cart item" do
    expect(page).to have_text("2")
    click_link_or_button("+")
    expect(page).to have_text("3")
  end

  it "can decrease quantity of cart item" do
    expect(page).to have_text("2")
    click_link_or_button("-")
    expect(page).to have_text("1")
  end
  
  it "cart item destroyed when decreased to 0" do
    click_link_or_button("+")
    3.times do
      click_link_or_button("-")
    end
    expect(page).not_to have_button("Remove From Cart")
  end
 
end
