Rails.application.routes.draw do
  # error pages
  %w( 404 422 500 503 ).each do |code|
    get code, :to => "errors#show", :code => code
  end
    
  get 'items/autocomplete_item_name'
  get 'schools/autocomplete_school_name'
  # Routes for main resources
  resources :items
  resources :purchases
  resources :item_prices
  resources :schools
  
  # Semi-static page routes
  get 'home' => 'home#home', as: :home
  get 'about' => 'home#about', as: :about
  get 'contact' => 'home#contact', as: :contact
  get 'privacy' => 'home#privacy', as: :privacy
  get 'sandbox' => 'home#sandbox', as: :sandbox

  get 'order_items/ship_item'

  get 'browse' => 'items#browse', as: :browse
  get 'details' => 'items#details', as: :details

  get 'users/employees'
  get 'users/customers'
  get 'signup' => 'users#new', :as => :signup
  get 'user/dashboard' => 'users#dashboard'

  get 'login' => 'sessions#new', :as => :login
  get 'logout' => 'sessions#destroy', :as => :logout
  resources :users
  resources :sessions

  get 'cart/add' => 'orders#add'
  get 'cart/remove' => 'orders#remove'
  get 'cart/update' => 'orders#update'
  get 'cart/empty' => 'orders#empty'
  get 'cart/checkout' => 'orders#checkout'
  post 'orders/place'
  get 'cart' => 'orders#cart', as: :cart


  get 'orders/list'
  get 'orders/unshipped'
  get 'orders/cancel'
  resources :orders
  
  # Set the root url
  root :to => 'home#home'  

end