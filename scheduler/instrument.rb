module TW2
	class Instrument
		attr_reader :name, :person

		def initialize name, person
			@person = person
			@name = name
			@availability = Hash.new 
		end

		def to_s
			"<#{person.name}'s #{@name}>"
		end

		# def deep_clone
		# 	i = Instrument.new @name, @person.deep_clone
		# 	@availability.each_key do |demo|
		# 		i.availability_for demo #just calculuate it.
		# 	end
		# 	return i
		# end

		def availability_for demo
			if ((a = @availability[demo]))
				return a
			end

			a = @person.schedule.vertex demo.availability
			if a
				return a
			else
				raise " ! error: #{@person.name}'s #{self.name} cannot find availability for #{demo.name}"
			end
		end

	end
end