require "rails_helper"

describe "an unauthenticated user" do

  it "can visit the home page" do
    visit "/"

    expect(page).to have_text("Welcome to Mister Pizza!")
  end
end
