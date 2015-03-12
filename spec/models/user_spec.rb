require 'rails_helper'

RSpec.describe User, :type => :model do
  it "has a first_name, last_name, email, admin status and password" do
    user = User.new(user_attributes)
    
    expect(user.valid?).to eq(true)
  end

  it "has a first_name" do
    user = User.new(user_attributes(first_name: nil))

    expect(user.valid?).to eq(false)
  end

  it "has a last_name" do
    user = User.new(user_attributes(last_name: nil))

    expect(user.valid?).to eq(false)
  end

  it "has an email" do
    user = User.new(user_attributes(email: nil))

    expect(user.valid?).to eq(false)
  end
  
  xit "has a password" do
    user = User.new(user_attributes(password: nil))

    expect(user.valid?).to eq(false)
  end

  it "has an order" do
    user = User.create!(user_attributes)
    user.orders.create!(status: "shipped")
    
    expect(user.orders.first.status).to eq("shipped")
  end

  it "has many orders" do
  end
end
