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
  get "categories/action", as: "action"
  get "categories/drama", as: "drama"
  get "categories/fantasy", as: "fantasy"
  get "categories/comedy", as: "comedy"
  get "categories/romance", as: "romance"
  get "categories/kids", as: "kids"
  get "categories/sports", as: "sports"
  get "categories/musical", as: "musical"
  get "categories/anime", as: "anime"
  get "categories/thriller", as: "thriller"
  get "categories/documentary", as: "documentary"
  get "categories/masterpiece", as: "masterpiece"
  get "categories/music_dc", as: "music_dc"
  get "categories/music_mv", as: "music_mv"
  get "categories/horror", as: "horror"
  get "categories/hobby", as: "hobby"
  get "categories/japanese", as: "japanese"
  get "categories/live", as: "live"

end
