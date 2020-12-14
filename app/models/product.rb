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

  validates :name, presence: true, length: { maximum: 40 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :status_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_cost_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_days_id, presence: true, numericality: { other_than: 1 }
  validates :prefecture_id, presence: true, numericality: { other_than: 1 }
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :image, presence: true
end
