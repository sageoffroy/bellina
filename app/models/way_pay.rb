class WayPay < ApplicationRecord
	def get_index (monthly)
		case monthly # a_variable is the variable we want to compare
			when 1    
			  return c1
			when 2    
			  return c2
	  	when 3    
			  return c3
	  	when 4    
			  return c4
	  	when 5    
			  return c5
	  	when 6    
			  return c6
	  	when 7    
			  return c7
	  	when 8    
			  return c8
	  	when 9    
			  return c9
	  	when 10    
			  return c10
	  	when 11    
			  return c11
	  	when 12    
			  return c12 
			else
			  puts "it was something else"
			end
	end

	def to_s
		name
	end	

	def get_interest(total,fee)
		case fee 
  		when 1
    		c = c1
			when 3
				c = c3
			when 6
				c = c6
			when 9
				c = c9
			when 12
				c = c12
			end

		if c.nil?
			return nil
		else
			return total * c
		end
	end
end
