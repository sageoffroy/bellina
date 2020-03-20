class Client < ApplicationRecord

	has_many :sales
	has_many :payments

	def to_s
		if dni.nil? or dni.blank?	
			fullname
		else
			fullname + " (" + dni.to_s + " )"
		end
	end

	def get_debt
		amount = 0

		if !amount_old.nil?
			amount = amount_old
		end

		sales.each do |sale|
			amount = amount - sale.get_amount
		end

		payments.each do |payment|
			amount = amount + payment.get_amount
		end
		return amount.to_f
	end
end
