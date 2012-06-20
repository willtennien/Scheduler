module TW2

	class Demo
		attr_reader :name, :duration, :schedule, :availability, :required_instruments_scheduled, :required_instruments, :instruments, :required_space
		attr_accessor :space

		def initialize(hash) #initialize arguments: :name, :duration, :schedule, :instruments, :spaces
			@name = hash[:name]
			@duration = hash[:duration]
			@schedule = hash[:schedule]
			@availability = schedule.deep_clone
			instruments_array = hash[:instruments] || hash[:required_instruments]
			@required_instruments_scheduled = (hash[:instruments] || hash[:required_instruments])
			@required_instruments = @required_instruments_scheduled.dup
			@instruments = InstrumentCollection.new
			@required_space = hash[:space] || hash[:required_space]
			@space = nil
		end

		def to_s
			return "<#{@name} requires #{@required_instruments} and #{@required_space}, but has #{@instruments} and <#{@space}>; its @duration is #{@duration}, and @availability is #{@availability}.>"
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
				if instr_name == required_name
					return true
				end
			end
			return false
		end

		def requires_space? name_searched
			if name_searched >= @required_space
				return 1
			else
				return 0
			end
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
				raise " ! error: #{self.name} tried to remove a requirement for a #{instr_name}, \nwhich it does not require in the first place.\nRather, it requires #{@required_instruments}"
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