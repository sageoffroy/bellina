class Provider < ApplicationRecord
	has_many :trademarks

	def to_s
		name
	end
end
