Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://local-craft-market.netlify.app/', 'http://localhost:4200'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      expose: ['Access-Control-Allow-Origin'] # Expose the 'Access-Control-Allow-Origin' header
  end
end
