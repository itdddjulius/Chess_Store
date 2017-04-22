Rails.application.routes.draw do
  get 'items/autocomplete_item_name'
  
  # Routes for main resources
  resources :items
  resources :purchases
  resources :item_prices

  # Semi-static page routes
  get 'home' => 'home#home', as: :home
  get 'about' => 'home#about', as: :about
  get 'contact' => 'home#contact', as: :contact
  get 'privacy' => 'home#privacy', as: :privacy
  get 'sandbox' => 'home#sandbox', as: :sandbox

  get 'browse' => 'items#browse', as: :browse

  get 'user/edit' => 'users#edit', :as => :edit_current_user
  get 'signup' => 'users#new', :as => :signup
  get 'login' => 'sessions#new', :as => :login
  get 'logout' => 'sessions#destroy', :as => :logout
  resources :users
  resources :sessions
  
  # Set the root url
  root :to => 'home#home'  

end
