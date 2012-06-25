module TW2
	class SolutionState
		attr_accessor :instruments, :demos, :identifier

		@@id_counter = 1
		def initialize instruments, demos, matches, *others
			@instruments = Marshal.dump instruments
			@demos = Marshal.dump demos
			@matches = matches.clone #Matches cannot be altered.
			unless others.empty?
				@identifier = others[0] 
			else
				@identifier = @@id_counter
				@@id_counter += 1
			end
			end

		def recover
			return [(Marshal.load @instruments), (Marshal.load @demos), @matches.shift]
		end

		def to_s
			return "<SolutionState n.#{@identifier}>"
		end

		private 

		def open
			return [(Marshal.load @instruments), (Marshal.load @demos), @matches]
		end
	end
end