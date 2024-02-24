class Product < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :artisan, presence: true
  validates :image_url, presence: true # Add this line if image_url is required

  
  belongs_to :artisan
  has_many :order_items
  has_many :reviews
end
