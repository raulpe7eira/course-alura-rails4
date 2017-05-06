Rails.application.routes.draw do

  root "products#index"
  get "/products/new" => "products#new"
  post "/products" => "products#create"

end
