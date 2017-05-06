class ProductsController < ApplicationController

  def index
    @products_by_name = Product.all.order(:name).limit 5
    @products_by_price = Product.all.order(:price).limit 2
  end

  def find
    @name_to_find = params[:name]
    @products_finded = Product.where "name like ?", "%#{@name_to_find}%"
  end

  def new
    @product = Product.new
  end

  def create
    values = params.require(:product).permit :name, :description, :amount, :price
    @product = Product.new values

    if @product.save
      flash[:notice] = 'Produto salvo c/ sucesso!'
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    id = params[:id]
    Product.destroy id

    redirect_to root_url
  end

end
