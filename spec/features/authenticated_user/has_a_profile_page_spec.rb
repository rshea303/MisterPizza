require "rails_helper"

describe "user" do
  it "can visit profile page" do
    @user = User.create!(user_attributes)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit "/"
    click_link_or_button("Account Details")
    expect(page).to have_text("First Name: #{@user.first_name}")
    expect(page).to have_text("Last Name: #{@user.last_name}")
  end
end
