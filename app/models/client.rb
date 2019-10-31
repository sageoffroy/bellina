class Client < ApplicationRecord

	def to_s
		fullname + " (" + dni.to_s + " )"
	end


end
