Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :costumes, only: [:destroy]
  resources :requests, only: [:destroy, :update]
  resources :review, only: [:destroy]

  resources :costumes, only: [:index, :new, :create, :show, :edit, :update] do
    resources :requests, only: [ :create ]
  end

  resources :requests, only: [ :index ] do
    resources :reviews, only: [:new, :create, :update]
  end

  resources :users, only: [:show]

  namespace :my do
    resources :requests, only: :index
  end
end
