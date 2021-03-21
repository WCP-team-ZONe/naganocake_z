class Product < ApplicationRecord
  has_many :cart_products, dependent: :destroy
  has_many :ordered_products, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :ex_price, presence: true
  validates :is_active, inclusion: { in: [true, false] }

  attachment :image
end
