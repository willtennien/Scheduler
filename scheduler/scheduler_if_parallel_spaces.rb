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
		S = 1
		C = 1
		A = 1

		def initialize
			@instruments = InstrumentCollection.new
			@instruments_of_category = []
			@spaces = SpaceCollection.new
			@spaces_of_quality = []
			@demos = DemoCollection.new
			@matches = []
			@saved_data = []
			@solutions = [] 
		end

		#first add people whose spaces and instruments match a demo.

		private

		def solution_score instruments, demos
			raise " ! error: I attempted to calculate score a solution before completely calculating it." unless demos.fulfilled? 
			return demos.length
		end

		def price_of instrument_name  #price is the quotient of an instrument's demand and supply (price = demand / supply)
			return (@demos.demand instrument_name).to_f / (@instruments.supply instrument_name).to_f
		end

		def price_of_space space_name
			return (@demos.demand_space space_name).to_f / (@space.supply space_name).to_f
		end

		def priciest_instrument #returns a name
			types = Hash.new 
			@instruments.each do |instrument|
				types[instrument.name] ||= 0
				types[instrument.name] += price_of instrument.name
			end

			return (types.sort {|a,b| -(a[1]<=>b[1]) }).first.first #the second ".first" extractes the instrument name from the [name,price] array.
		end

		def priciest_space
			types = Hash.new
			@spaces.each do |space|
				types[space.name] || = 0
				types[space.name] += price_of space.name
			end

			return (types.sort {|a,b| -(a[1]<=>b[1]) }).first.first 
		end

		def log_data
			Log.new @instruments, @spaces, @demos, @matches
		end

		def print_solution 
			if @demos.empty?
							puts "\n(Solution botched)."
			else
							puts "\nSolution: "
				@demos.each do |demo|
					if demo.fulfilled?
							puts "    #{demo.name} meets during #{demo.availability} with:"
						demo.instruments.each do |instrument|
							puts "        #{instrument.person.name}'s #{instrument.name},"
							puts "        at #{demo.space.person}'s #{demo.space.name}."
						end
					end
				end
			end
		end

		def save_solution
			@solutions.push log_data
		end

		def remove_impossible_demos
			to_remove = []
			@demos.each do |demo|
				demo.required_instruments.each do |required_instr_name|
					instrument_availability = AvailableTime.new []
					@instruments.each do |instr|
						instrument_availability.union! instr.availability if instr.name == required_instr_name 
					end
					instrument_availability.vertex! demo.availability
					if !instrument_availability.has_contiguous? demo.duration
						to_remove.push demo 
					else #don't check space availability if no instrument availability exists.
						space_availability = AvailableTime.new []
						@spaces.each do |space|
							space_availability.union! space.availability if space.name > demo.required_space_quality
						end
						space_availability.vertex! demo.availability
						if !space_availability.has_contiguous? demo.duration
							to_remove.push demo
						end
					end
				end
			end
			to_remove.each do |demo|
				demo.instruments.each do |instrument|
					@instruments.concat instrument.person.instruments
				end
				if demo.space
					#..
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
			@matches.sort {|a,b| (a.value_with @instruments, @demos, D, S, C, A) <=> (b.value_with @instruments, @demos, D, S, C, A)}
		end

		def execute match
			item, demo = match.unpack @instruments, @demos
			assign instrument, demo
		end

		def assignment_cycle
			remove_impossible_demos

			@instruments_of_category = @instruments.called priciest_instrument
			@matches.clear

			@instruments_of_category.each do |instrument|
				@demos.each do |demo|
					@matches.push Match.new instrument, demo if demo.requires? instrument.name
				end
			end

			sort_matches_by_value

			unless @matches.empty?
				match = @matches.shift
				@save_timer -= 1
				if @save_timer == 0 
					@save_timer = SAVING_INFREQUENCY
					@saved_data.push log_data
				end
				execute match
				return true
			else
				return false
			end
		end

		def find_solutions
			@save_timer = SAVING_INFREQUENCY

			while !@demos.fulfilled?
				break if !((assignment_cycle)) # if (assignment-cycle-fails)
			end

			print_solution
			save_solution

			recover_log
		end

		def recover_log
			if !((log = @saved_data.pop))
				puts "\nI have found all matches.\n"
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
			puts "I have begun assignment..."
			remove_impossible_demos
			@saved_data[0] = Log.new @instruments, @demos, @matches
			find_solutions 

			solution_scores = Hash.new
			@solutions.each do |log|
				instruments, demos = log.recover
				#raise " ! error: a match exists in a supposedly complete solution." if match
				solution_scores[[instruments, demos]] = solution_score instruments, demos
			end

			solution_scores = solution_scores.sort { |a,b| -(a[1] <=> b[1]) }

			a_solution, top_score = solution_scores.shift
			top_solutions = []
			top_solutions.push a_solution
			loop do
				a_solution, score = solution_scores.shift
				if score != top_score
					break
				else
					top_solutions.push a_solution
				end
			end

			puts
			puts "Best solution(s):"
			puts "================="
			top_solutions.each do |solution|
				@instruments, @demos = solution
				print_solution
			end
		end
	end
end