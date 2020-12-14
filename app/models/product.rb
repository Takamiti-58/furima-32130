class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :prefecture
  has_one :order
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :itemcondition
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :prepare

  with_options presence: true, numericality: { other_than: 1 } do
    validates :status_id
    validates :shipping_cost_id
    validates :shipping_days_id
    validates :prefecture_id
    validates :category_id
  end
  validates :name, presence: true, length: { maximum: 40 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :image, presence: true
end
