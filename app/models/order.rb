class Order < ApplicationRecord
  belongs_to :member
  has_many :ordered_products, dependent: :destroy

  validates :postage, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :payment, presence: true
  validates :total_price, presence: true
  validates :order_status, presence: true

  enum payment: { "1":1, "0":0 }
end
