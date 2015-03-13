class Item < ActiveRecord::Base
  has_many :line_items
  has_many :orders, through: :line_items

  belongs_to :category
  
  validates :name, :description, :price, :image_file_name, presence: true
end
