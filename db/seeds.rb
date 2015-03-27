# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
class Categories
  def make_categories
    ["pizza", "calzones", "pasta", "dessert", "beverages"].each do |cat|
      Category.create(name: "#{cat}")
    end
  end
end


class Items
  def path
    "app/assets/images/"
  end

  def make_items
    [
      Item.create(name: "cheese pizza", description: "delicous cheesy pizza", price: "1000", image: open(path  + "cheese_pizza.jpg"), category_id: 1),
      Item.create(name: "pepperoni pizza", description: "delicous cheesy pizza", price: "1100", image_file_name: "default", category_id: 1),
      Item.create(name: "hawaiian pizza", description: "delicous cheesy pizza", price: "1200", image_file_name: "default", category_id: 1),
      Item.create(name: "meatball pizza", description: "delicous cheesy pizza", price: "1300", image_file_name: "default", category_id: 1),
      Item.create(name: "vegetarian pizza", description: "delicous cheesy pizza", price: "1400", image_file_name: "default", category_id: 1),
      Item.create(name: "cheese calzone", description: "delicous calzone", price: "1600", image_file_name: "default", category_id: 2),
      Item.create(name: "pepperonie calzone", description: "delicous calzone", price: "1700", image_file_name: "default", category_id: 2),
      Item.create(name: "meatball calzone", description: "delicous calzone", price: "1800", image_file_name: "default", category_id: 2),
      Item.create(name: "vegetarian calzone", description: "delicous calzone", price: "1900", image_file_name: "default", category_id: 2),
      Item.create(name: "everything calzone", description: "delicous calzone", price: "2000", image_file_name: "default", category_id: 2),
      Item.create(name: "baked ziti", description: "delicous ziti", price: "1250", image_file_name: "default", category_id: 3), 
      Item.create(name: "spaghetti", description: "delicous spaghetti", price: "1350", image_file_name: "default", category_id: 3),
      Item.create(name: "ravioli", description: "delicous ravioli", price: "1450", image_file_name: "default", category_id: 3),
      Item.create(name: "ice cream", description: "delicous ice cream", price: "1000", image_file_name: "default", category_id: 4),
      Item.create(name: "cake", description: "delicous cake", price: "2000", image_file_name: "default", category_id: 4),
      Item.create(name: "cupcake", description: "delicous cupcake", price: "3000", image_file_name: "default", category_id: 4),
      Item.create(name: "soda", description: "delicous soda", price: "1000", image_file_name: "default", category_id: 5),
      Item.create(name: "lemonade", description: "delicous lemonade", price: "1100", image_file_name: "default", category_id: 5),
      Item.create(name: "iced tea", description: "delicous iced tea", price: "1200", image_file_name: "default", category_id: 5),
      Item.create(name: "bottled water", description: "delicous bottled water", price: "1300", image_file_name: "default", category_id: 5)
    ]
  end
end

class Users
  def make_users
    User.create(first_name: "user1_first_name", last_name: "user1_last_name", email: "user1@example.com", password: "password")
    User.create(first_name: "user2_first_name", last_name: "user2_last_name", email: "user2@example.com", password: "password")
    User.create(first_name: "user3_first_name", last_name: "user3_last_name", email: "user3@example.com", password: "password", admin: true)
  end
end


Categories.new.make_categories
Items.new.make_items
Users.new.make_users
