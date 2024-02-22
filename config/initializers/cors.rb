# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost:4200'  # Update this with the address of your Angular application
    resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options]
  end
end
