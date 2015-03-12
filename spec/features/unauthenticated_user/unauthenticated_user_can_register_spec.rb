require "rails_helper"

describe "an unauthenticatedr" do
  
  it "can register" do
    visit "/"
    click_link_or_button("Register")
    fill_in "user[first_name]", with: "first_name"
    fill_in "user[last_name]", with: "last_name"
    fill_in "user[email]", with: "test@example.com"
    fill_in "user[password]", with: "password"
    click_link_or_button("Submit New Registration")
    expect(current_path).to eq(root_path)
    click_link_or_button("Log In")
    fill_in "session[email]", with: "test@example.com"
    fill_in "session[password]", with: "password"
    click_link_or_button("Submit")
    expect(page).to have_text("Log Out")
    expect(page).not_to have_text("Log In")
  end
end
