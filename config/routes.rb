Rails.application.routes.draw do
  resources :certificates
  resources :blogs do
    resource :title_image, only: [:destroy], module: :blogs
  end
  resources :attendances
  resources :grades
  resources :courses
  resources :academic_classes
  devise_for :users
  resources :users, only: [:show, :edit, :update] do
    resource :profile_picture, only: [:destroy], module: :users
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get 'dashboard', to: 'pages#dashboard'
  get 'home', to: 'pages#home'
  get 'settings', to: 'pages#settings'
  get 'profile', to: 'users#show'
  get 'help', to: 'pages#help'
  # Defines the root path route ("/")
  authenticated :user do
    root to: 'pages#home', as: :authenticated_root
  end
  root "pages#index"
end
