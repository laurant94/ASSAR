Rails.application.routes.draw do

  root to:"starter#index"
  resources :starter, only: [:index, :new, :create]
  resources :users

  namespace :app do
    root to: "dashboard#index"
    get '/login', to: "sessions#new", as: :login
    post '/login', to: "sessions#create"
    get 'profil', to: "sessions#show", as: :profil
    post 'logout', to: "sessions#destroy", as: :logout

    get 'dashboard', to: "dashboard#index", as: :dashboard
    
    resources :posts
    
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

  namespace :admin do
    resources :churches
  end

end
