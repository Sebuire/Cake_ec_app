class Genre < ApplicationRecord
	has_many :items
	validates :name, presence: true, length: { maximum: 15}
end
