Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get '/', to: 'palettes#index'

  resources :colours
  resources :comments
  resources :likes
  resources :palettes
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
