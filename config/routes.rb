Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :categories
      resources :products
      resources :subcategories
      resources :profils
      resources :orders
      resources :line_items
      resources :carts

      root to: "users#index"
    end
  resources :profils


  get "/buy", to:"pages#buy"
  get "/sell", to:"pages#sell"
  get "/panier", to:"pages#panier"
  get "/retrait", to:"pages#retrait"
  get "/myproduct", to:"pages#product"
  post "/validate_order", to:"orders#validate_order"

  devise_for :users
  resources :orders
  resources :charges

  resources :line_items
  resources :carts
  root "catalogue#index"
  resources :products

end
