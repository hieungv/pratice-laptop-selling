Rails.application.routes.draw do
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
  # post "/product", to: "products#create"
  get "/product_details", to: "static_pages#product_details"
  get "admin/admin"
  get "admin/index"
  get "/checkorder", to: "line_items#index"
  get "/check", to: "line_items#show"
  get "/search", to: "static_pages#index"
  get "/show_code_order", to: "orders#show_code_order"
  get "/show_order", to: "orders#show"
  post "/order_status", to: "orders#update"
  get "/create_order", to: "carts#index"
  resources :carts
  resources :products
  resources :users
  resources :orders
  resources :line_items
  resources :feedbacks
end
