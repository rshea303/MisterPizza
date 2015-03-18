require "rails_helper"

describe "user" do

  it "can view its account page" do
    @user = User.create!(user_attributes)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit user_path(@user)

    expect(page).to have_text("First Name: #{@user.first_name}")
    expect(page).to have_text("Last Name: #{@user.last_name}")
  end
  
  it "cannot view account page unless logged in" do
    @user = User.create!(user_attributes)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
    visit user_path(@user)

    expect(page).to have_text("Denied access")
    expect(current_path).to eq(login_path)
  end

end
