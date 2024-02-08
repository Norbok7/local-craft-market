class Product < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :artisan, presence: true
  
  belongs_to :artisan
  has_many :order_items
  has_many :reviews
end
