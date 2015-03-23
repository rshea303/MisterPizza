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

  def sign_in(user)
    visit login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on("Submit")
  end
end
