class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  def index
    @products = Product.all.order("created_at DESC")
  end

  def new
    @products = Product.new
  end

  def create
    @products = Product.new(product_params)
    if @products.valid?
       @products.save
       redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @products = Product.find(params[:id])
  end

  def update
    products = Product.find(params[:id])
    if products.valid?
       products.update(product_params)
       redirect_to edit_product_path
    else
      render :edit
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :status_id, :shipping_cost_id, :shipping_days_id, :prefecture_id, :category_id, :image).merge(user_id: current_user.id)
  end
end
