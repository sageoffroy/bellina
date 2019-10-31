class Size < ApplicationRecord
	def to_s
		'Nº ' + number.to_s
	end

	def code
		'N' + number.to_s
	end
end
