class Item < ApplicationRecord
	has_many :order_item
	has_many :carts, dependent: :destroy
	belongs_to :genre
	acts_as_paranoid
	attachment :image

	validates :genre_id, presence: true
	validates :name, presence: true, length: { maximum: 20}
	validates :body, presence: true, length: { maximum: 300}
	validates :price, presence: true
	validates :sales_status, inclusion: {in: [true, false]}
end
