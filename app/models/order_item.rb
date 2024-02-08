class OrderItem < ApplicationRecord
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :unit_price, presence: true, numericality: { greater_than: 0 }
  validates :order, presence: true
  validates :product, presence: true
  
  belongs_to :order
  belongs_to :product
end
