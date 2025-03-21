Rails.application.routes.draw do
  # Root path
  root 'pages#home'
  
  # Static pages
  get 'about', to: 'pages#about'
  
  # Blog routes
  resources :posts, path: 'blog' do
    resources :comments, only: [:create, :destroy], controller: 'posts', action: 'create_comment'
  end
  get 'weekly-fix', to: 'posts#index', as: 'weekly_fix'
  
  # Store routes
  resources :products
  resources :orders, only: [:index, :show, :new, :create]
  
  # Cart and checkout
  resource :cart, only: [:show, :update, :destroy]
  post 'cart/add/:id', to: 'carts#add', as: 'add_to_cart'
  delete 'cart/remove/:id', to: 'carts#remove', as: 'remove_from_cart'
  
  # User authentication
  get 'signup', to: 'users#new', as: 'signup'
  post 'users', to: 'users#create'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  
  # Newsletter subscription
  resources :subscribers, only: [:new, :create]
  get 'unsubscribe', to: 'subscribers#unsubscribe'
  
  # Admin dashboard
  namespace :admin do
    get '/', to: 'dashboard#index'
    resources :posts
    resources :products
    resources :orders, only: [:index, :show, :update]
    resources :subscribers, only: [:index, :destroy]
    resources :comments, only: [:index, :destroy]
  end
end