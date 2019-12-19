class Item < ApplicationRecord
	has_many :order_items
	has_many :carts
	belongs_to :genre
	acts_as_paranoid
end
