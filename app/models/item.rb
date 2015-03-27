class Item < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  has_many :line_items
  has_many :orders, through: :line_items

  belongs_to :category
  
  validates :name, :description, :price, presence: true
end
