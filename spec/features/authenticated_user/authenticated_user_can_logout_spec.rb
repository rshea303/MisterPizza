require 'rails_helper'

describe "an authenticated user" do 
  include Capybara::DSL

  it "can logout out" do
    user = User.create!(user_attributes)
    visit "/"
    sign_in(user)

    expect(page).to have_text("Log Out")
    click_on("Log Out")

    expect(page).to have_text("Log In")
    expect(page).not_to have_text("Log Out")  
  end

end
