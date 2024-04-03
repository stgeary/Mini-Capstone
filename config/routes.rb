Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get "/shop", controller: "products", action: "shop"
  get "/products" => "products#index"
  get "products/:id" => "products#show"
  post "/products" => "products#create"
  get "one_product", controller: "products", action: "one_product"
  patch "/products/:id" => "products#patch"
  delete "/products/:id" => "products#destroy"
  get "/enter" => "products#enter"

  get "/suppliers" => "suppliers#suppliers"
  get "suppliers/:id" => "suppliers#show"
  post "/suppliers" => "suppliers#create"
  get "one_supplier", controller: "suppliers", action: "one_supplier"
  patch "/suppliers/:id" => "suppliers#patch"
  delete "/suppliers/:id" => "suppliers#destroy"

  get "/images" => "images#images"
  get "images/:id" => "images#show"
  post "/images" => "images#create"
  get "one_image", controller: "images", action: "one_image"
  patch "/images/:id" => "images#patch"
  delete "/images/:id" => "images#destroy"

  post "/users" => "users#create"

  post "/sessions" => "sessions#create"

  get "/orders" => "orders#index"
  get "/orders/:id" => "orders#show"
  post "/orders" => "orders#create"

  get "/cart" => "carted_products#index"
  post "/cart" => "carted_products#create"
end
