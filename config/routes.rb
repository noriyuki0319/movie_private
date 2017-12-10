Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'
  devise_for :users
  resources :movies
  resources :users
    resources :posts do
      resources :comments do
    end
  end
  root 'movies#index'
end
