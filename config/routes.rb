Rails.application.routes.draw do

  get "login", to: "sessions#new", as: "login"
  post "sessions", to: "sessions#create", as: "sessions"
  delete "sessions", to: "sessions#destroy", as: "logout"
  get '/', to: 'palettes#index'

  get 'palettes/new/:num', to: 'palettes#new', as: 'new_palette'

  resources :colours
  resources :comments
  resources :likes
  resources :palettes do
    resources :likes
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
