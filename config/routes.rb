Rails.application.routes.draw do

  root "products#index"

  get '/products/find' => 'products#find', as: :find_product
  resources :products, only: [:new, :create, :destroy]

end
