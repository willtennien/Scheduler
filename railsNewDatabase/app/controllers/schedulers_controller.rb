class SchedulersController < ApplicationController

	def load
		s = Scheduler.new
		s.save
		s.load
		if s.save
			@saved = true
		else
			@saved = false
		end
	end

	def run
		s = Scheduler.first
		if s
			s.run
			puts "TEST-TEST-TEST-TEST"
			@ran = true
		else
			@ran = false
		end
	end
end