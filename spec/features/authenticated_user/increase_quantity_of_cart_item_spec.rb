require "rails_helper"

describe "user" do
  
  before do
    @category = Category.create(name: "pizza")
    @category.items.create!(name: "cheese pizza", description: "yummy", price: 2500, image_file_name: "default")
    user = User.create!(user_attributes)
    sign_in(user) 
    visit "/"
    click_on("pizza")
    2.times do
      click_on("Add To Cart")
    end
    click_on("Items in Cart")
  end

  it "can increase quantity of cart item" do
    expect(page).to have_text("2")
    click_on("+")
    expect(page).to have_text("3")
  end

  it "can decrease quantity of cart item" do
    expect(page).to have_text("2")
    click_on("-")
    expect(page).to have_text("1")
  end
  
  it "cart item destroyed when decreased to 0" do
    click_on("+")
    3.times do
      click_on("-")
    end
    expect(page).not_to have_button("Remove From Cart")
  end

  def sign_in(user)
    visit login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on("Submit")
  end
 
end
