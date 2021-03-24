class Address < ApplicationRecord
  belongs_to :member

  validates :name, presence: true
  validates :postal_code, presence: true
  validates :postal_code, length: { is: 7 }
  validates :address, presence: true

  def full_shipping_address
    "〒" + self.postal_code + " - " + self.address + " - " + self.name
  end
end