require "rails_helper"

describe "user" do

  it "can view its account details page" do
    user = User.create!(user_attributes)
    sign_in(user)
    visit user_path(user)

    expect(page).to have_text("First Name: #{user.first_name}")
    expect(page).to have_text("Last Name: #{user.last_name}")
  end
  
  it "cannot view account page unless logged in" do
    user = User.create!(user_attributes)
    visit "/"
    visit user_path(user)

    expect(page).to have_text("Denied access")
    expect(current_path).to eq(login_path)
  end

end
