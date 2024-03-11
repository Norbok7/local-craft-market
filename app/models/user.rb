class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  # validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :user_type, presence: true, inclusion: { in: %w(Artisan Buyer) }
  
  has_secure_password # Add this line to enable password authentication
  
  has_many :artisans
  has_many :products, through: :artisans
  has_many :orders
  has_many :reviews
end
