module TW2
	class DemoCollection < Array
		def demand instr_name
			sum = 0
			each do |demo|
				sum += demo.required instr_name 
			end
			return sum
		end

		def demand_space space_quality
			sum = 0
			each do |demo|
				sum += 1 if space_quality >= demo.required_space
			end
			return sum
		end

		# def demanding_rank n
		# 	begin 
		# 		sort!
		# 		fetch n
		# 	rescue
		# 		raise " ! error: #{self} either could not sort or fetch the instrument ranking #{n}th by demand."
		# 	end
		# end

		def fulfilled?
			each do |demo|
				return false unless demo.fulfilled?
			end
			return true
		end
	end
end