Rails.application.routes.draw do
  devise_for :users
  
  # Главная страница для всех пользователей
  root to: 'topics#index'

  # CRUD для тем, включая вложенные маршруты для комментариев
  resources :topics do
    resources :comments, only: [:create]
  end
  get 'coming_soon', to: 'application#coming_soon'

  # Маршруты для админ-панели
  namespace :admin do
    get '/', to: 'dashboard#index', as: :dashboard
    resources :users, only: [:index, :destroy]
    resources :topics, only: [:index, :destroy]
    resources :comments, only: [:index, :destroy]
  
  end
end
