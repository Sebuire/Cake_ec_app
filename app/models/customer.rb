class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :addresses
  has_many :orders
  has_many :carts, dependent: :destroy
  acts_as_paranoid
  accepts_nested_attributes_for :addresses
  validates :name_last_kanji, presence: true
  validates :name_first_kanji, presence: true
  validates :name_last_kana, presence: true
  validates :name_first_kana, presence: true
  validates :phone_number, presence: true, numericality: {only_integer: true}
end
