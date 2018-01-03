Rails.application.routes.draw do
  get "posts/google" => 'posts#google_map', as: "google_maps"
  get "categories/index", as: "categories"
  get "categories/categories_list", as: "categories_list"
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
end
