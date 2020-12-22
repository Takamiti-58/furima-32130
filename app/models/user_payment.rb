class UserPayment
  include ActiveModel::Model
  attr_accessor :post_code,:prefecture_id,:city,:address,:building_name,:phone_number,:user_id,:product_id,:token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, length: { is: 11, messsage: "too long" }
    validates :product_id
    validates :token
    validates :user_id
  end


  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    Buyer.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end