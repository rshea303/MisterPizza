require 'rails_helper'

describe "an authenticated user" do 

  it "can logout out" do
    user = User.create!(user_attributes)
    visit "/"
    sign_in(user)

    expect(page).to have_text("Log Out")

    click_link_or_button("Log Out")

    expect(page).to have_text("Log In")
    expect(page).not_to have_text("Log Out")  
  end

  def sign_in(user)
    visit login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Submit"
  end
end
