Rails.application.routes.draw do
  # Authentication routes
  devise_for :users
  
  # Root route
  root to: 'topics#index'

  # Topic routes with nested comments
  resources :topics do
    resources :comments, only: [:create]
  end

  # Static pages
  get '/coming_soon', to: 'coming_soon#index'

  # Subscription management
  resources :subscriptions, only: [:create]

  # Admin namespace
  namespace :admin do
    get '/', to: 'dashboard#index', as: :dashboard
    
    resources :users,    only: [:index, :destroy]
    resources :topics,   only: [:index, :destroy]
    resources :comments, only: [:index, :destroy]
  end
end
