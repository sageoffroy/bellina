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
end
