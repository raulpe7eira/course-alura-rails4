class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy]
  before_action :set_departments, only: [:new, :edit]

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
    @product = Product.new product_params
    if @product.save
      flash[:notice] = 'Produto salvo c/ sucesso!'
      redirect_to root_url
    else
      set_departments
      render :new
    end
  end

  def update
    if @product.update product_params
      flash[:notice] = 'Produto atualizado c/ sucesso!'
      redirect_to root_url
    else
      set_departments
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_url
  end

  private

    def set_departments
      @departments = Department.all
    end

    def set_product
      id = params[:id]
      @product = Product.find(id)
    end

    def product_params
      params.require(:product).permit :name, :description, :amount, :price, :department_id
    end

end
