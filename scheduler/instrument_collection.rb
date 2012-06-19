module TW2
	class InstrumentCollection < Array
		def supply instr_searched
			d = 0
			name_searched = instr_searched.name
			each do |instrument|
				if instrument.name == name_searched
					d += 1.0/instrument.person.instruments.length
				end
			end
			return d
		end

		def instrument_names
			names = map do |instrument|
				instrument.name
			end
			return names.uniq!
		end

		def of person_searched
			result = []
			each do |instrument|
				result.push instrument if instrument.person == person_searched
			end
			return result
		end

		def called name_searched
			result = []
			each do |instrument|
				result.push instrument if instrument.name == name_searched
			end
			return result
		end

		def remove_of person_searched
			self.replace self - (self.of person_searched)
		end

		def supply_ranking n
			names = {}
			each do |instrument|
				names[instrument.name] ||= 0
				names[instrument.name] = names[instrument.name] + 1
			end
			return (names.sort {|a,b| a[1] <=> b[1]}).map! {|pair| pair[0]}
		end
	end
end