Rails.application.routes.draw do
  # Define routes for the Artisans controller
  resources :artisans

  # Define routes for the Products controller nested under Artisans
  resources :artisans do
    resources :products
  end

  # Define a custom route for fetching products by artisan ID
  get 'artisans/:id/products', to: 'products#by_artisan'

  # Define routes for the Orders controller
  resources :orders

  # Define routes for the OrderItems controller nested under Orders
  resources :orders do
    resources :order_items
  end

  # Define routes for the Users controller
  resources :users

  # Define routes for the Reviews controller
  resources :reviews

  # Define routes for the Sessions controller
  resources :sessions, only: [:new, :create, :destroy]

  # Define routes for the Admin namespace
  namespace :admin do
    resources :dashboard, only: [:index]
  end

  # Add route for the OrderItems controller
  resources :order_items

  # Route for the Products controller
  resources :products

  # Other routes and root route definitions can go here
end
