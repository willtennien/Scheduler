require_relative 'scheduler'
include TW2

s = Scheduler.new

#begin pseudodata
bob = Person.new :bob, (AvailableTime.new [[5,6]]) 
s.instruments.push Instrument.new :guitar, bob
s.demos.push Demo.new(:name => :first_project, :instruments => [:guitar], :duration => 1, :schedule => (AvailableTime.new [[1,2],[5,7]] ))
#end pseudodata

s.calculate