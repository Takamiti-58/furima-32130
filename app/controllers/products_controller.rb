class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @products = Product.order("created_at DESC")
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

  private

  def product_params
    params.require(:product).permit(:id, :name, :price, :description, :status_id, :shipping_cost_id, :shipping_days_id, :prefecture_id, :category_id, :image).merge(user_id: current_user.id)
  end
end
