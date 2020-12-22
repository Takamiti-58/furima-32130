class OrdersController < ApplicationController
  before_action :set_products, only: [:index,:create]
  before_action :authenticate_user!, only: [:create,:index]

  def index
    if current_user.id == @product.user_id || @product.order.present?
      redirect_to root_path
    end
     @user_payment = UserPayment.new
   end

  def create
    @user_payment = UserPayment.new(payment_params)
    if @user_payment.valid?
       pay_item
       @user_payment.save
       redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def payment_params
    params.require(:user_payment).permit(:post_code,:prefecture_id,:city,:address,:building_name,:phone_number,:product_id,:order_id).merge(user_id: current_user.id, product_id: params[:product_id],token: params[:token])
  end

  def set_products
    @product = Product.find(params[:product_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @product.price,
        card: payment_params[:token],
        currency: 'jpy'
      )
  end
end
