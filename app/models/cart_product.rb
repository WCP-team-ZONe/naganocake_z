class CartProduct < ApplicationRecord
  belongs_to :member
  belongs_to :product

  validates :quantity, presence: true
end
