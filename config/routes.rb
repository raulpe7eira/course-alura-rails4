Rails.application.routes.draw do

  root "products#index"

  get "/products/new" => "products#new"
  post "/products" => "products#create"
  delete "/products/:id" => "products#destroy", as: :product

end
