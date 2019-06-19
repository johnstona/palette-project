Rails.application.routes.draw do

  get 'errors/not_found'
  get 'errors/internal_server_error'
  get "login", to: "sessions#new", as: "login"
  post "sessions", to: "sessions#create", as: "sessions"
  delete "sessions", to: "sessions#destroy", as: "logout"
  get '/', to: 'palettes#index', as: "index"

  get 'palettes/new/:num', to: 'palettes#new', as: 'new_palette'

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  get "/about", to: 'static#about'
  get "/terms", to: 'static#terms'
  get "/cookies", to: 'static#cookies'
  get "/mit", to: 'static#mit'


  resources :colours
  resources :comments
  resources :likes
  resources :palettes do
    resources :likes, :comments
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
