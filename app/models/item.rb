class Item < ActiveRecord::Base
  belongs_to :category
  
  validates :name, :description, :price, :image_file_name, presence: true
end
