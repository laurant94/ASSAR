Rails.application.routes.draw do
  root to:"starter#index"
  resources :starter, only: [:index, :new, :create]
  resources :children
  resources :churches
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
