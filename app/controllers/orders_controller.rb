class OrdersController < ApplicationController
  before_action :set_products, only: [:index,:create]

  def index
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
    Payjp.api_key = "sk_test_873834869699a8a6bf4b503d"
      Payjp::Charge.create(
        amount: @product.price,
        card: payment_params[:token],
        currency: 'jpy'
      )
  end
end
