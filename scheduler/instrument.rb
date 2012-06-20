module TW2
	class Instrument
		attr_reader :name

		def initialize name
			@name = name
			@person = nil
			@availability = Hash.new 
		end

		def to_s
			if @person
				"<#{@person.name}'s #{@name}>"
			else
				"<unowned #{@name}>"
			end
		end

		def person
			if @person 
				return @person
			else
				raise " ! error: #{self} does not yet have a person."
			end
		end

		def person=(p)
			if @person
				raise " ! error: I tried to change #{self}'s person to #{p}."
			else
				@person = p
			end
		end

		def availability_for demo
			if ((a = @availability[demo]))
				return a
			end

			raise " ! error: #{self} does not yet have a person." unless person #remove later
			a = @person.schedule.vertex demo.availability
			if a
				return a
			else
				raise " ! error: #{@person.name}'s #{self.name} cannot find availability for #{demo.name}"
			end
		end
	end
end