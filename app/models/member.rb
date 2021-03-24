class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses
  has_many :cart_products
  has_many :orders

  validates :first_name, presence: true
  validates :family_name, presence: true
  validates :first_kana, presence: true
  validates :family_kana, presence: true
  validates :postal_code, presence: true
  validates :postal_code, length: { is: 7 }
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :phone_number, length: { in: 10..11 }
  validates :email,uniqueness: true 
  validates :is_deleted, inclusion: { in: [true, false] }

  #「退会してる？」を判別
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
end