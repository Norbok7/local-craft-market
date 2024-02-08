# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

# Create users
# db/seeds.rb

# Create users
user1 = User.create(username: "artisan1", password: "password1", email: "artisan1@example.com", user_type: "Artisan")
user2 = User.create(username: "buyer1", password: "password2", email: "buyer1@example.com", user_type: "Buyer")

# Create artisans
artisan1 = Artisan.create(user: user1, artisan_name: "John Doe", artisan_bio: "I'm a skilled artisan specializing in woodworking.", location: "New York", profile_picture: "artisan1.jpg")

# Create products for artisan1
product1 = Product.create(artisan: artisan1, title: "Handcrafted Wooden Table", description: "Beautiful handmade wooden table", category: "Furniture", price: 200.00, quantity: 5, image_url: "table.jpg")
product2 = Product.create(artisan: artisan1, title: "Wooden Chess Set", description: "Hand-carved chess set made from high-quality wood", category: "Toys & Games", price: 50.00, quantity: 10, image_url: "chess_set.jpg")

# Create orders for user2 (buyer)
order1 = Order.create(user: user2, order_date: Date.today, total_amount: 250.00)

# Add order items to order1
order_item1 = OrderItem.create(order: order1, product: product1, quantity: 1, unit_price: 200.00)
order_item2 = OrderItem.create(order: order1, product: product2, quantity: 1, unit_price: 50.00)

# Create reviews
review1 = Review.create(user: user2, product: product1, rating: 5, comment: "Excellent craftsmanship!", date: Date.today)
review2 = Review.create(user: user2, product: product2, rating: 4, comment: "Great quality, but delivery took longer than expected.", date: Date.today)
