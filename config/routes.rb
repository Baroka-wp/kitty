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
  mount ActionCable.server => '/cable'

  get "/buy", to:"pages#buy"
  get "/sell", to:"pages#sell"
  get "/panier", to:"pages#panier"
  get "/retrait", to:"pages#retrait"
  get "/myproduct", to:"pages#product"
  post "/validate_order", to:"orders#validate_order"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  resources :orders do
    resources :chats
  end
  resources :charges

  resources :line_items
  resources :carts
  root "catalogue#index"
  resources :products

end
