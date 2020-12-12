class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @products = Product.order("created_at DESC")
  end

  def new
    @products = Product.new
  end

  def create
    @products = Products.new(product_params)
    if @product.valid?
      @product.save 
      return redirect_to root_path
    else
      render "new"
    end
  end

  private

  def product_params
  params.require(:user_product).permit()
  end
end
