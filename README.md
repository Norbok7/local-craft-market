# E-Commerce Platform Backend

Welcome to our E-Commerce platform backend repository! This Rails application serves as the backbone for our platform, handling user authentication, product listings, order management, and more.

## Project Structure

The project follows a modular structure to organize different aspects of the platform:

- User management
- Artisan management
- Product listings
- Order management
- Review management

Each module consists of models, controllers, and serializers tailored to its specific functionality.

## Setup Instructions

1. Clone this repository to your local machine.
2. Navigate to the project directory.
3. Install dependencies by running `bundle install`.
4. Set up the database with `rails db:create` and `rails db:migrate`.
5. Start the Rails server with `rails server`.
6. Ensure the frontend is configured to communicate with the backend APIs.

## API Endpoints

- The backend exposes RESTful APIs for user registration, authentication, and profile management.
- Endpoints also handle product listings, order placement, review submission, and more.

## Database Schema

- The database schema is designed to support relationships between users, artisans, products, orders, and reviews.
- Refer to the schema file for details on tables and their associations.

## Authentication and Authorization

- User authentication is implemented using JWT (JSON Web Tokens).
- Authorization logic restricts access to certain routes and actions based on user roles.

<!-- ## Admin Dashboard in progress not deployed -->

<!-- - An admin dashboard provides insights into platform activity, allowing administrators to manage users, products, orders, and reviews. -->

## Gems Added

- gem 'jwt'
- gem 'rack-cors'
- gem 'bcrypt'
- gem 'pusher'
- gem 'pg'
- gem "faker"

## Feedback and Contributions

We value feedback and contributions from the community! If you encounter any issues, have suggestions for improvement, or would like to contribute, please open an issue or submit a pull request.



