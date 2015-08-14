class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save!
      flash[:success] = "Product created!"
      redirect_to products_path
    else
      flash[:danger] = "Error creating this product"
      redirect_to new_product_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end

end