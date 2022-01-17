Rails.application.routes.draw do

  root to:"starter#index"
  resources :starter, only: [:index, :new, :create]
  resources :users

  # Application routes
  namespace :app do
    root to: "dashboard#index"
    get '/login', to: "sessions#new", as: :login
    post '/login', to: "sessions#create"
    get 'profil', to: "sessions#show", as: :profil
    post 'logout', to: "sessions#destroy", as: :logout

    get 'dashboard', to: "dashboard#index", as: :dashboard
    get 'settings', to: 'settings#edit', as: :settings
    patch 'settings', to: 'settings#update'

    resources :posts, :events
    resources :connecteds, only: [:index, :create, :update, :destroy]
    resources :collects do
      member do
        post "contribute", to: "collects#contribute", as: :contribution
      end
    end
    
    
    resources :children
    # Group and members
    resources :groups do
      member do
        post "add-members", to: "groups#add_members", as: :add_members_to
        get "eject-member/:user_id", to: "groups#eject_member", as: :eject_member_from
      end
    end
    
    resources :faithfuls do
      member do
        get "approve", to: "faithfuls#approve", as: :approve
        get "eject", to: "faithfuls#eject", as: :eject
      end
    end
  end


  # faithful user routes
  namespace :me, only: [:index, :show, :update] do
    root to: 'posts#index'
    resources :posts do
      member do
        patch 'like', to: "posts#like", as: :like
        patch 'comment', to: 'posts#comment', as: :comment
        patch 'favorite', to: 'posts#favorite', as: :favorite
      end
    end
    get '/calendar', to: 'posts#calendar', as: :calendar
    get '/favorites', to: 'posts#favorites', as: :favorites

    resources :groups, only: [:show, :update]
  end


  namespace :admin do
    resources :churches
  end


  mount Pwa::Engine, at: ''

end
