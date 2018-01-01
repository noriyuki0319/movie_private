Rails.application.routes.draw do
  get 'users/index'
  get "posts/google" => 'posts#google_map', as: "google_maps"
  get "movies/sample"
  get "/movies/search" => 'movies#twittersearch', as: "twitter_search"
  get 'users/show'
  devise_for :users
  resources :movies
  resources :users
  resources :reviews
  resources :posts do
    resources :comments
  end
  resources :movies do
    resources :reviews
  end
  root 'movies#index'

  get "categories/index", as: "categories"
  get "categories/categories_list", as: "categories_list"

end
