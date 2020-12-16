class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_products, only: [:edit,:update]

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
    if @products.user.id != current_user.id
      redirect_to root_path
    end
  end

  def update
    @products.update(product_params)
    if @products.valid?
       redirect_to product_path
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

  def set_products
    @products = Product.find(params[:id])
  end
end
