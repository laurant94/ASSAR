Rails.application.routes.draw do

  
  root to:"starter#index"
  resources :starter, only: [:index, :new, :create]
  resources :users

  namespace :app do
    root to: "sessions#new"
    get '/login', to: "sessions#new", as: :login
    post '/login', to: "sessions#create"
    get 'profil', to: "sessions#show", as: :profil
    post 'logout', to: "sessions#destroy", as: :logout

    get 'dashboard', to: "dashboard#index", as: :dashboard
    resources :posts
    resources :children
  end

  namespace :admin do
    resources :churches
  end

end
