module TW2
	class DemoCollection < Array
		def demand instrument
			sum = 0
			each do |demo|
				sum += demo.required instrument 
			end
		end

		def demanding_rank n
			begin 
				sort!
				fetch n
			rescue
				raise " ! error: #{self} either could not sort or fetch the instrument ranking #{n}th by demand."
			end
		end

		def complete?
			each do |demo|
				return false unless demo.closed? || demo.required_instruments.empty?
			end
			return true
		end
	end
end