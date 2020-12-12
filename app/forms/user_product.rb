class UserProduct

  include ActiveModel::Model
  attr_accessor :nickname, :email, :encrypted_password, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_day, :name, :price, :description, :status_id, :shipping_cost_id, :shipping_days_id, :preference_id, :category_id, :user_id

end