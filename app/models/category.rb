class Category < ApplicationRecord

	validates :code , presence: true
	validates :code, length: { is: 4 }	

	def to_s
		name
	end
	
end
