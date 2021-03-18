class OrderedProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true
  validates :purchased_price, presence: true
  validates :production_status, presence: true
end
