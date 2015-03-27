require "rails_helper"

describe "user" do
  it "can visit profile page" do
    user = User.create!(user_attributes)
    visit "/"
    sign_in(user)
    click_on("Account Details")
    expect(page).to have_text("First Name: #{user.first_name}")
    expect(page).to have_text("Last Name: #{user.last_name}")
  end

end
