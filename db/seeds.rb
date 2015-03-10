# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
class Categories
  cats = %(pizza calzones pasta dessert beverages)

  def make_categories
    cats.each do |cat|
      Category.new(name: "#{cat}")
    end
  end
end

Categories.new.make_categories
#
#
#
# items
items = [
  item1.create(name: "cheese pizza", description: "delicous cheesy pizza", price: "1000", category_id: 1),
  item1.create(name: "pepperoni pizza", description: "delicous cheesy pizza", price: "1100", category_id: 1),
  item1.create(name: "hawaiian pizza", description: "delicous cheesy pizza", price: "1200", category_id: 1),
  item1.create(name: "meatball pizza", description: "delicous cheesy pizza", price: "1300", category_id: 1),
  item1.create(name: "vegetarian pizza", description: "delicous cheesy pizza", price: "1400", category_id: 1),
  item1.create(name: "cheese calzone", description: "delicous cheesy pizza", price: "1600", category_id: 2),
  item1.create(name: "pepperonie calzone", description: "delicous cheesy pizza", price: "1700", category_id: 2),
  item1.create(name: "meatball calzone", description: "delicous cheesy pizza", price: "1800", category_id: 2),
  item1.create(name: "vegetarian calzone", description: "delicous cheesy pizza", price: "1900", category_id: 2),
  item1.create(name: "everything calzone", description: "delicous cheesy pizza", price: "2000", category_id: 2),
  item1.create(name: "cheese pizza", description: "delicous cheesy pizza", price: "1250", category_id: 3), 
  item1.create(name: "cheese pizza", description: "delicous cheesy pizza", price: "1350", category_id: 3),
  item1.create(name: "cheese pizza", description: "delicous cheesy pizza", price: "1450", category_id: 3),
  item1.create(name: "cheese pizza", description: "delicous cheesy pizza", price: "1000", category_id: 4),
  item1.create(name: "cheese pizza", description: "delicous cheesy pizza", price: "2000", category_id: 4),
  item1.create(name: "cheese pizza", description: "delicous cheesy pizza", price: "3000", category_id: 4),
  item1.create(name: "cheese pizza", description: "delicous cheesy pizza", price: "1000", category_id: 5),
  item1.create(name: "cheese pizza", description: "delicous cheesy pizza", price: "1100", category_id: 5),
  item1.create(name: "cheese pizza", description: "delicous cheesy pizza", price: "1200", category_id: 5),
  item1.create(name: "cheese pizza", description: "delicous cheesy pizza", price: "1300", category_id: 5),
        ]
