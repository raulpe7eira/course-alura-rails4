Rails.application.routes.draw do

  resources :departments
  resources :products, only: [:new, :create, :destroy, :edit, :update]
  get '/products/find' => 'products#find', as: :find_product
  root "products#index"

end
