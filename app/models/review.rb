class Review < ApplicationRecord
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :comment, presence: true
  validates :date, presence: true
  validates :product, presence: true
  validates :user, presence: true
  
  belongs_to :product
  belongs_to :user
end
