Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'
  get "/movies/search" => "movies#search"
  devise_for :users
  resources :users
  resources :movies
  root 'movies#index'
end
