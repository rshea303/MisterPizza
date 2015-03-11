require 'rails_helper'

describe "an authenticated user" do

  it "can log in" do
    user = User.create!(user_attributes)
    visit "/"
    click_link_or_button("Log In")
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    click_link_or_button("Submit")

    expect(page).to have_text("Log Out")
    expect(page).not_to have_text("Log In")
  end
end
