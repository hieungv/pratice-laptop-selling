Rails.application.routes.draw do
  resources :orders
  #root "products#index"
  root "static_pages#index"
  get "sessions/new"
  get "/index", to: "static_pages#index"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  get "/admin", to: "products#index"
  post "/login", to: "sessions#create"
  post "/signup", to: "users#create"
  delete "/logout", to: "sessions#destroy"
  post "/line_item", to: "line_items#create"
  resources :users
  get "/product_details", to: "static_pages#product_details"
  get "admin/admin"
  get "admin/index"
  #root "admin#admin"
  #get "admin/admin"
  resources :products
  resources :carts
  resources :line_items
end
