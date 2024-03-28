Rails.application.routes.draw do
  # Define a custom route for fetching products by artisan ID
  get 'artisans/:artisan_id/products', to: 'products#by_artisan'

  # Define routes for the Artisans controller
  resources :artisans do
    resources :products
  end

  # Define routes for the Orders controller
  resources :orders do
    resources :order_items
  end

  # Define a custom route for fetching orders by user ID
  get 'users/:user_id/orders', to: 'orders#by_user'

  # Define routes for the Users controller
  resources :users

  # Define routes for the Reviews controller
  resources :reviews

  # Define route for creating reviews for a specific product
  post 'products/:product_id/reviews', to: 'reviews#create'

  # Define routes for the Sessions controller
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Define routes for the Admin namespace
  # namespace :admin do
  #   resources :dashboard, only: [:index]
  # end

  # Add route for the OrderItems controller
  resources :order_items

  # Define routes for the Products controller
  resources :products

  # Define a custom route for changing user password
  put '/users/:id/change-password', to: 'users#change_password', as: 'change_user_password'

  # Custom route for fetching reviews for a specific product
  get 'products/:product_id/reviews', to: 'reviews#by_product', as: 'product_reviews'

  # Custom route for fetching the current user
  get '/users/current', to: 'users#current'
end
