class Artisan < ApplicationRecord
  # validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 4 }
  validates :bio, presence: true # Make bio required
  validates :user_type, presence: true, inclusion: { in: %w(Artisan Buyer) } # Ensure user_type is one of "Artisan" or "Buyer"

  has_many :products
end
