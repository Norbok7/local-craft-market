class Artisan < ApplicationRecord
  validates :artisan_name, presence: true
  # validates :location, presence: true
  validates :bio, presence: true, allow_blank: true # Make bio optional

  belongs_to :user
  has_many :products
end
