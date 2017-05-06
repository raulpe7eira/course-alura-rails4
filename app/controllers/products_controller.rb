class ProductsController < ApplicationController

  def index
    @products_by_name = Product.all.order(:name).limit 5
    @products_by_price = Product.all.order(:price).limit 2
  end

  def create
    values = params.require(:product).permit :name, :description, :amount, :price
    product = Product.create values

    redirect_to root_url
  end

  def destroy
    id = params[:id]
    Product.destroy id

    redirect_to root_url
  end

end
