class Review < ApplicationRecord
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :comment, presence: true
  # Remove validation for `date` as it's not necessary
  # validates :date, presence: false

  # Ensure that `product_id` is present
  validates :product_id, presence: true

  # Remove validation for `user` if it's not necessary
  # validates :user, presence: false

  belongs_to :product
  # Ensure that `user_id` is present if the association is required
  belongs_to :user, optional: true # Change to `optional: false` if `user_id` is required
end
