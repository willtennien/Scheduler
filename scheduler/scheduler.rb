module TW2
	require_relative 'available_time'
	require_relative 'person'
	require_relative 'instrument'
	require_relative 'instrument_collection'
	require_relative 'demo'
	require_relative 'demo_collection'
	require_relative 'match'
	require_relative 'log'

	class Scheduler
		attr_reader :instruments, :demos

		SAVING_INFREQUENCY = 1
		D = 10
		C = 1
		A = 1

		def initialize
			@instruments = InstrumentCollection.new
			@instruments_of_category = []
			@demos = DemoCollection.new
			@matches = []
			@saved_data = []
		end

		private

		def price_of instrument  #price is the difference between an instrument's demand and supply (price = demand - supply)
			return @demos.demand instrument - (@instruments.supply instrument)
		end

		def priciest_instrument #returns a name
			types = Hash.new 
			@instruments.each do |instrument|
				types[instrument.name] ||= 0
				types[instrument.name] += price_of instrument 
			end

			return (types.sort {|a,b| -(a[1]<=>b[1]) }).first.first #the second ".first" extractes the instrument name from the [name,price] array.
		end

		def demos_fulfilled
			@demos.each do |demo|
				return false unless demo.required_instruments.empty?
			end
			return true
		end

		def print_solution 
					puts "Solution: "
			@demos.each do |demo|
					puts "    #{demo.name}:"
				demo.instruments.each do |instrument|
					puts "        #{instrument.person.name}'s #{instrument},"
				end
			end
		end

		def remove_impossible_demos
			to_remove = []
			@demos.each do |demo|
				demo.required_instruments.each do |required_instr|
					instrument_availability = AvailableTime.new
					@instruments.each do |instr|
						instrument_availability.union! (instr.availability_for demo)
					end
					instrument_availability.vertex! demo.availability
					if !instrument_availability.has_contiguous? demo.duration
						#begin testing
						raise "This should never print. -from remove_impossible_demos" 
						#end testing
						to_remove.push demo 
					end
				end
			end
			to_remove.each do |demo|
				demo.instruments.each do |instrument|
					@instruments.concat instrument.person.instruments
				end
				@demos.delete demo
			end
		end

		def assign instrument, demo
			demo.availability.vertex! instrument.person.schedule
			@instruments.remove_of instrument.person
			demo.remove_requirement instrument.name
			demo.instruments.push instrument
		end

		def sort_matches_by_value
			@matches.sort {|a,b| (a.value_with @instruments, @demos, D, C, A) <=> (b.value_with @instruments, @demos, D, C, A)}
		end

		def execute match
			instrument, demo = match.unpack @instruments, @demos
			assign instrument, demo
		end

		def assignment_cycle
			remove_impossible_demos

			@instruments_of_category = @instruments.called priciest_instrument
			@matches.clear

			@instruments_of_category.each do |instrument|
				@demos.each do |demo|
					@matches.push Match.new instrument, demo
				end
			end

			sort_matches_by_value

			execute @matches.shift
		end

		def find_solutions
			save_timer = SAVING_INFREQUENCY

			while !demos_fulfilled
				assignment_cycle

				save_timer -= 1
				if save_timer == 0 
					save_timer = SAVING_INFREQUENCY
					@saved_data.push Log.new @instruments, @demos, @matches
				end
			end

			print_solution

			recover_log
		end

		def recover_log
			if !((log = @saved_data[0]))
				puts "I have found all matches."
			else
				@instruments, @demos, next_match = log.recover
				if (@instruments && @demos && next_match) #prune for efficiency here.
					execute next_match
					find_solutions
				else 
					@saved_data.pop
					recover_log
				end
			end
		end

		public 

		def calculate 
			assignment_cycle 
			if !@saved_data.empty?# to remove
				raise " ! error: saved_data is not empty after the first assignment_cycle."
			end
			@saved_data[0] = Log.new @instruments, demos, matches
			find_solutions 
		end
	end
end