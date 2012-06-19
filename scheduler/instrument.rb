module TW2
	class Instrument
		attr_reader :name, :person

		def initialize name, person
			@person = person
			@name = name
			@availability = Hash.new 
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

			p @person.schedule
			p demo.schedule
			a = @person.schedule.vertex demo.schedule
			if a
				return a
			else
				raise " ! error: #{self} cannot find availability for #{demo}"
			end
		end

	end
end