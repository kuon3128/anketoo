Rails.application.routes.draw do

  get 'choices/create'
  get 'choices/destroy'
  get 'create/destroy'
  root to: "questions#index"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  get "signup", to: "users#new"
  
  resources :questions, only: [:index, :show, :new, :create, :destroy] do
    collection do
      get :finish
      get :all
    end
  end
  
  resources :users, only: [:create]
  resources :choices, only: [:show, :create, :destroy]
  
end
