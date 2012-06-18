module TW2
	class Person
		attr_accessor :instruments, :schedule

		def initialize name, schedule
			@name = name
			@instruments = []
			@schedule = schedule
		end

		# def deep_clone
		# 	result = Person.new
		# 	result.schedule = @schedule.deep_clone
		# 	@instruments.each do |instrument|
		# 		instrument.person = result
		# 		result.instruments.push instrument
		# 	end
		# end
	end
end