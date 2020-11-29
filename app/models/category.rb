class Category < ApplicationRecord

	has_many :client

	validates :code , presence: true
	validates :code, length: { is: 4 }

	def to_s
		name
	end

end
