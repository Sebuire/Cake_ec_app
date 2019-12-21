class Item < ApplicationRecord
	has_many :order_item
	has_many :carts
	belongs_to :genre
	acts_as_paranoid
	enum sales_status:{販売中: 0, 売り切れ: 1}
	attachment :image
end
