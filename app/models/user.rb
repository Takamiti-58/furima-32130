class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :password, length: { minimum: 6 }
    validates :encrypted_password, length: { minimum: 6 }
    validates :first_name, format: { with: /\A[一-龥ぁ-ん]/ }
    validates :last_name, format: { with: /\A[一-龥ぁ-ん]/ }
    validates :first_name_kana, format: { with: /\A[ぁ-ん]/ }
    validates :last_name_kana, format: { with: /\A[ぁ-ん]/ }
    validates :birth_day
  end
end