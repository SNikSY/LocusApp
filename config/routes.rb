Rails.application.routes.draw do
  namespace :api, format: 'json' do
    namespace :v1 do
      resources :topics
    end
  end
  # Authentication routes
  devise_for :users, controllers: {
  registrations: 'users/registrations'
}

  # Root route
  root to: 'topics#index'

  # Topic routes with nested comments and like action
  resources :topics do
    resources :comments, only: [:create]
    member do
      post 'like', to: 'topics#like'
    end
  end
  
  # Static pages
  get '/coming_soon', to: 'coming_soon#index'
  get '/about', to: 'pages#about', as: :about

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
