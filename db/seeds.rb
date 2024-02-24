require 'httparty'

def random_image_url
  response = HTTParty.get('https://picsum.photos/200/300')
  return response.request.last_uri.to_s
end

# Seed 25 artisans with associated users
25.times do
  user = User.create!(
    username: Faker::Internet.unique.username,
    password: 'password',
    email: Faker::Internet.unique.email,
    user_type: 'Artisan'
  )

  Artisan.create!(
    user: user,
    artisan_name: Faker::Company.name,
    location: Faker::Address.city,
    bio: Faker::Lorem.paragraph
  )
end

# Seed 85 homecraft products
85.times do
  artisan = Artisan.all.sample

  Product.create!(
    artisan: artisan,
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    category: Faker::Commerce.department,
    price: Faker::Commerce.price(range: 10..100),
    quantity: Faker::Number.between(from: 1, to: 100),
    image_url: random_image_url
  )
end

# Create orders, order items, and reviews as needed
