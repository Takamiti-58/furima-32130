class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :prefecture
  has_one :order
  has_one_attached :image
  belongs_to_active_hash :brand
  belongs_to_active_hash :itemconditon
  belongs_to_active_hash :postage
  belongs_to_active_hash :prepare

  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validares :status_id, presence: true
  validares :shipping_cost_id, presence: true
  validares :shipping_days_id, presence: true
  validates :prefecture_id, presence: true
  validares :category_id, presence: true
  validares :user_id, presence: true
  validates :brand_id, numericality: { other_than: 0 }
  validates :itemconditon_id, numericality: { other_than: 0 }
  validates :postage_id, numericality: { other_than: 0 }
  validates :prepare_id, numericality: { other_than: 0 }
  validates :prefecture_id, numericality: { other_than: 0 }
end
