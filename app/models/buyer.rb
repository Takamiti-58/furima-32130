class Buyer < ApplicationRecord
  belongs_to :order
  has_one_attached :image
end
