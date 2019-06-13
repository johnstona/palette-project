Rails.application.routes.draw do
  resources :colours
  resources :comments
  resources :likes
  resources :pallettes
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
