require_relative 'scheduler'

class Test
	include TW2

	def load
		s = Scheduler.new 
	end

	def run
	end
end

t = Test.new
t.run