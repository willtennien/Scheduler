module TW2
	class Demo
		attr_reader :required_instruments, :required_instruments_scheduled, :instruments, :required_spaces, :schedule, :availability, :duration

		def initialize(hash)
			@name = hash[:name]
			@required_instruments_scheduled = hash[:instruments] || hash[:required_instruments]
			@required_instruments = {}.replace @required_instruments_scheduled
			@instruments = []
			@required_spaces = hash[:spaces] || hash[:required_spaces]
			@schedule = hash[:schedule]
			@availability = []
			@schedule.each do |a|
				@availability.push a.clone
			end
			@duration = hash[:duration]
			@closed? = false
		end

		def required instrument
			return sum
		end

		def remove_requirement instr_name
			@required_instruments.each_index do |i,instr|
				if instr.name == instr_name
					index = i
				end
			end
			if index
				@required_instruments.delete_at index 
			else
				raise " ! error: #{self} tried to remove a requirement for a #{instr_name}, which it does not require in the first place."
			end
		end

		def availability_with
			return instrument.availability_for self
		end

		def <=> other
			@required_instruments.length <=> other.required_instruments.length
		end
	end
end