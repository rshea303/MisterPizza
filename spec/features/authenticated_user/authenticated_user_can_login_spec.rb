require 'rails_helper'

describe "an authenticated user" do

  it "can log in" do
    user = User.create!(user_attributes)
    sign_in(user)
    visit "/"

    expect(page).to have_text("Log Out")
    expect(page).not_to have_text("Log In")
  end

  def sign_in(user)
    visit login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Submit"
  end
end
