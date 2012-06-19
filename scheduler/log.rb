module TW2
	class Log
		attr_accessor :instruments, :demos, :identifier

		# def initialize
		# 	@instruments = "" #remember that "instruments" is a string!
		# 	@demos = "" #remember that "demos" is a string!
		# end
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
			return "<Log n.#{@identifier}>"
		end

		private 

		def open
			return [(Marshal.load @instruments), (Marshal.load @demos), @matches]
		end
	end
end