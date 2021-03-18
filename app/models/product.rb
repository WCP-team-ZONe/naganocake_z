class Product < ApplicationRecord
  has_many :cart_products, dependent: :destroy
  has_many :ordered_products, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :ex_price, presence: true
  validates :is_active, presence: true
<<<<<<< HEAD

  attachment :image
end
=======
  
  attachment :image
end
>>>>>>> c37e5803b4aadd3ce6f614f6a2014eedfec12142
