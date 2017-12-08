Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'
  devise_for :users
  resources :users
  resources :movies
  resources :posts
  resources :comments
  root 'movies#index'
end
