class Order < ApplicationRecord
  validates :order_date, presence: true
  validates :total_amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :user, presence: true
  
  belongs_to :user
  has_many :order_items, dependent: :destroy
end
