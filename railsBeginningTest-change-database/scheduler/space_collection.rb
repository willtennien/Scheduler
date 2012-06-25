module TW2
	class SpaceCollection < InstrumentCollection

		def max_name
			if empty?
				return nil
			else
				max = 0
				each do |space|
					if (n = space.name) > max
						max = n
					end
				end
				return max
			end
		end
		# def has_space? name_searched
		# 	each do |space|
		# 		return true if space.name > name_searched
		# 	end
		# end
	end
end