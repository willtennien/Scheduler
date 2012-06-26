module TW2
	class Person
		attr_reader :name, :instruments, :spaces, :schedule

		def initialize name, schedule
			@name = name
			@instruments = InstrumentCollection.new
			# instruments.each do |instrument|
			# 	@instruments.push instrument
			# end
			@spaces = SpaceCollection.new
			# spaces.each do |space|
			# 	@spaces.push space
			# end
			@schedule = schedule
		end

		def to_s
			"<Person: #{@name} owns #{@instruments.names} and #{@spaces.names}.>"
		end

		def label_instruments
			@instruments.each do |instrument|
				instrument.person = self
			end
		end

		def label_spaces
			@spaces.each do |space|
				space.person = self
			end
		end
	end
end