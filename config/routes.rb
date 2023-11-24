Rails.application.routes.draw do
  resources :certificates
  resources :blogs
  resources :attendances
  resources :grades
  resources :courses
  resources :academic_classes
  resources :users
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get 'dashboard', to: 'pages#dashboard'
  # Defines the root path route ("/")
  authenticated :user do
    root to: 'pages#dashboard', as: :authenticated_root
  end
  root "pages#home"
end
