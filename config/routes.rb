Rails.application.routes.draw do
  devise_for :users
  resources :guests
  resources :rooms
  get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
