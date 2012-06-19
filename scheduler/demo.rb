module TW2
	class Demo
		attr_reader :name, :required_instruments, :required_instruments_scheduled, :instruments, :required_spaces, :duration, :schedule, :availability

		def initialize(hash) #initialize arguments: :name, :instruments, :spaces (to be added later), :duration, :schedule
			@name = hash[:name]
			@required_instruments_scheduled = hash[:instruments] || hash[:required_instruments]
			@required_instruments = [].replace @required_instruments_scheduled
			@instruments = []
			#@required_spaces = hash[:spaces] || hash[:required_spaces]
			@duration = hash[:duration]
			@schedule = hash[:schedule]
			@availability = schedule.deep_clone
			#@closed = false
		end

		def to_s
			return "<#{@name} requires #{@required_instruments}, but has #{@instruments}; its @duration is #{@duration}, and @availability is #{@availability}.>"
		end

		def required instrument_name
			sum = 0
			@required_instruments.each do |required_name|
				if required_name == instrument_name
					sum += 1
				end
			end
			return sum
		end

		def fulfilled?
			return @required_instruments.empty?
		end

		def requires? instr_name
			@required_instruments.each do |required_name|
				return true if instr_name == required_name
			end
			return false
		end

		def remove_requirement instr_name
			index = nil
			@required_instruments.each_index do |i|
				if @required_instruments[i] == instr_name
					index = i
					break
				end
			end
			if index
				@required_instruments.delete_at index 
			else
				raise " ! error: #{self.name} tried to remove a requirement for a #{instr_name}, \nwhich it does not require it in the first place.\nRather, it still requires #{@required_instruments}."
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