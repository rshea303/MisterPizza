require 'rails_helper'

describe "an authenticated user" do 

  it "can logout out" do
    user = User.create!(user_attributes)
    visit "/"
    click_link_or_button("Log In")
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    click_link_or_button("Submit")
    click_link_or_button("Log Out")

    expect(page).to have_text("Log In")
    expect(page).not_to have_text("Log Out")  
  end
end
