module TW2
	class Log
		attr_accessor :instruments, :demos

		# def initialize
		# 	@instruments = "" #remember that "instruments" is a string!
		# 	@demos = "" #remember that "demos" is a string!
		# end

		def initialize instruments, demos, matches
			@instruments = Marshal.dump instruments
			@demos = Marshal.dump demos
			@matches = matches #Matches cannot be altered.
		end

		def recover
			if @matches.empty?
				return nil
			else
				return [Marshal.load @instruments, Marshal.load @demos, @matches.shift]
			end
		end

		def to_s
			return "#{self}:\n    #{Marshal.load @instruments}\n    #{Marshal.load @demos}"
		end

		private 

		def open
			return [Marshal.load @instruments, Marshal.load @demos, @matches]
		end

	end
end