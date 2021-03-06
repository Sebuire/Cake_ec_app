class Order < ApplicationRecord
	belongs_to :customer
	has_many :order_items
	enum payment:{クレジットカード:0, 銀行振込:1}
	enum order_status:{入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済み:4}
	accepts_nested_attributes_for :order_items

	def calculate_quantity
		quantity = 0
		self.order_items.each do |order_item|
			quantity = quantity + order_item.quantity
			# quantity += order_item.quantity
		end
		return quantity
	end
end
