# Hardcopy - Sustainable Technology Website

Hardcopy is a Ruby on Rails application for a sustainable technology business with three main goals:
1. To stop technology going to landfill
2. To help put knowledge back in our hands around how to fix things
3. To sell cool, refurbished products

## Features

- **Blog/Newsletter**: "The Weekly Fix" - Articles and repair guides
- **Online Store**: Sell refurbished technology and accessories
- **About Section**: Information about the business mission and values
- **Optional User Accounts**: Sign up and login for additional features
- **Shopping Cart**: Add products, update quantities, and checkout
- **Order Management**: Process and track orders
- **Admin Dashboard**: Manage products, posts, orders, and more
- **Newsletter Subscription**: Allow users to subscribe to "The Weekly Fix"
- **Comments**: Registered users can comment on blog posts

## User Authentication System

The user authentication system is designed to be optional for most features:

- **Guest Users Can**:
  - Browse all pages and products
  - Add items to cart and complete checkout
  - View blog posts
  - Subscribe to the newsletter (with email management)
  - Track orders with unique order tokens

- **Registered Users Can**:
  - Do everything guests can do
  - Comment on blog posts
  - Track order history in their account
  - Manage their newsletter subscriptions
  - Access saved shipping information

- **Admin Users Can**:
  - Access the admin dashboard
  - Manage products, posts, and orders
  - Moderate comments
  - View subscriber information

## Requirements

- Ruby 3.0.0 or higher
- Rails 6.1.0 or higher
- PostgreSQL
- Node.js and Yarn (for Webpacker)

## Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/hardcopy.git
cd hardcopy
```

2. Install dependencies:
```bash
bundle install
yarn install
```

3. Setup the database:
```bash
rails db:create
rails db:migrate
rails db:seed # Optional: Seeds the database with sample data
```

4. Start the Rails server:
```bash
rails server
```

5. Visit `http://localhost:3000` in your browser

## Admin Setup

To access the admin dashboard, you need to create an admin user:

1. Open Rails console:
```bash
rails console
```

2. Create an admin user:
```ruby
User.create!(
  name: "Admin User",
  email: "admin@example.com",
  password: "password",
  password_confirmation: "password",
  role: 1 # Admin role
)
```

3. Exit the console and log in with the admin credentials at `http://localhost:3000/login`

4. Access the admin dashboard at `http://localhost:3000/admin`

## Adding Content

### Adding Products

1. Log in as an admin
2. Navigate to the admin dashboard
3. Click on "Manage Products"
4. Click "Add New Product"
5. Fill in the product details and upload images

### Creating Blog Posts

1. Log in as an admin
2. Navigate to the admin dashboard
3. Click on "Manage Posts"
4. Click "Add New Post"
5. Write your content using the rich text editor and publish

## Customization

### Styling

The application uses Bootstrap 5 for styling. You can customize the look and feel by modifying:

- `app/assets/stylesheets/application.scss` - Main stylesheet
- `app/views/layouts/application.html.erb` - Main layout template

### Configuration

Key configuration files:

- `config/database.yml` - Database configuration
- `config/routes.rb` - Application routes
- `config/environments/` - Environment-specific settings

## Development

### Running Tests

```bash
rails test
```

### Debugging

```bash
rails console
```

## Order System

The order system supports both guest and registered users:

- **Guest Users**: Can place orders and receive a unique tracking URL to check order status
- **Registered Users**: Orders are automatically associated with their account for easy tracking

## Newsletter System

The newsletter subscription system:

- Allows both guest and registered users to subscribe
- Creates a unique token for each subscriber for secure unsubscription
- Associates subscriptions with user accounts when available
- Sends "The Weekly Fix" updates to active subscribers

## Blog and Comments

The blog system includes:

- Rich text articles with featured images
- Comment functionality (requires user account)
- Related posts suggestions
- Social sharing options

## Deployment

### Heroku Deployment

1. Create a Heroku account and install the Heroku CLI
2. Create a new Heroku app:
```bash
heroku create hardcopy-app
```

3. Add PostgreSQL addon:
```bash
heroku addons:create heroku-postgresql
```

4. Push to Heroku:
```bash
git push heroku main
```

5. Run migrations:
```bash
heroku run rails db:migrate
```

6. Create an admin user:
```bash
heroku run rails console
# Then create the admin user as described in the Admin Setup section
```

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgements

- [Ruby on Rails](https://rubyonrails.org/)
- [Bootstrap](https://getbootstrap.com/)
- [Font Awesome](https://fontawesome.com/)
- [Stimulus JS](https://stimulus.hotwired.dev/)