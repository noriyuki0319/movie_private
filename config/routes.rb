Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  devise_for :users
  resources :users
  get 'movies/search', as: 'movies_search'
  resources :movies
  root 'movies#index'
end
