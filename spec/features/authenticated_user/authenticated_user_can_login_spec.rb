require 'rails_helper'

describe "an authenticated user" do

  it "can log in" do
    user = User.create!(user_attributes)
    sign_in(user)
    visit "/"

    expect(page).to have_text("Log Out")
    expect(page).not_to have_text("Log In")
  end

end
