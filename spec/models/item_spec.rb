require 'rails_helper'

RSpec.describe Item, :type => :model do

  context "validations" do

    it "has a name, price, description, and image_file_name" do
      item = Item.new(item_attributes)

      expect(item.valid?).to eq(true)
    end

    it "is invalid without a name" do
      item = Item.new(item_attributes(name: nil))

      expect(item.valid?).to eq(false)
    end

    it "is invalid without a price" do
      item = Item.new(item_attributes(price: nil))

      expect(item.valid?).to eq(false)
    end

    it "is invalid without a description" do
      item = Item.new(item_attributes(description: nil))

      expect(item.valid?).to eq(false)
    end

  end

  context "belongs to category" do

    it "belongs to a category" do
      category = Category.create!(name: "Parent")
      category.items.new(item_attributes)

      expect(category.items.first.name).to eq("itemname")
    end
  end
end
