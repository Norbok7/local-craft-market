class Artisan < ApplicationRecord
  validates :artisan_name, presence: true
  validates :location, presence: true
  validates :bio, presence: true, allow_blank: true # Make bio optional

  
  has_many :products
end
