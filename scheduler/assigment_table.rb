module TW2
	class AssignmentTable
		def initialize instruments
			@instruments = Hash.new do |instrument|
				raise " ! error: #{self} cannot find #{instrument}."
			end
			instruments.each do |instrument|
				@instruments[instrument] = nil
			end
		end

		# def deep_clone
		# 	begin
		# 		return AssignmentTable.new({}.replace @instruments)
		# 	rescue
		# 		raise " ! error: deep_clone of #{self} failed."
		# 	end
		# end

		def supply instrument
			d = 0
			@instruments.each_key do |table_instr|
				if table_instr.name == instrument.name
					d += 1.0/table_instr.person.instruments.length
				end
			end
			return d
		end

		def demand_order

		end

		def assign instrument, demo
			@instruments[instrument] = demo
		end

		def instrument_names
			names = []
			@instruments.each_key do |instr|
				unless names.contains? instr.name
					names.push instr.name
				end
			end
		end

		def score
			return @instruments.values.uniq.length
		end

		def <=> other
			-(self.score <=> other.score)
		end
	end
end