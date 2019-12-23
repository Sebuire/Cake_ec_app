class Address < ApplicationRecord
	belongs_to :customer
	validates :address, presence: true
	validates :postal_code, presence: true, numericality: {only_integer: true}
end
