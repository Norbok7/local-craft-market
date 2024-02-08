class Artisan < ApplicationRecord
  validates :artisan_name, presence: true
  validates :location, presence: true
  validates :user, presence: true
  
  belongs_to :user
  has_many :products
end
