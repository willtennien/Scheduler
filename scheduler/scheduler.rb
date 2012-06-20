class Array
	def to_ic
		ic = InstrumentCollection.new
		each do |elem|
			ic.push elem
		end
		return ic
	end
end

module TW2
	require_relative 'available_time'
	require_relative 'person'
	require_relative 'instrument'
	require_relative 'instrument_collection'
	require_relative 'space'
	require_relative 'space_collection'
	require_relative 'demo'
	require_relative 'demo_collection'
	require_relative 'match'
	require_relative 'log'

	class Scheduler
		attr_reader :instruments, :demos

		SAVING_INFREQUENCY = 1
		D = 10
		C = 1
		S = 1
		A = 1

		def initialize people, demos
			@people = people
			@instruments = InstrumentCollection.new
			@demos = DemoCollection.new
			demos.each do |demo|
				@demos.push demo
			end
			@matches = []
			@saved_data = []
			@solutions = [] 
		end

		private

		def solution_score instruments, demos
			raise " ! error: I attempted to score a solution before completely calculating it." unless demos.fulfilled? 
			return demos.length
		end

		def price_of instrument_name  #price is the quotient of an instrument's demand and supply (price = demand / supply)
			return (@demos.demand instrument_name).to_f / (@instruments.supply instrument_name).to_f
		end

		def value_of_space_with instrument, space, demo
			return 0
		end

		def priciest_instrument #returns a name
			types = Hash.new 
			@instruments.each do |instrument|
				types[instrument.name] ||= 0
				types[instrument.name] += price_of instrument.name
			end

			return (types.sort {|a,b| -(a[1]<=>b[1]) }).first.first #the second ".first" extractes the instrument name from the [name,price] array.
		end

		def log_data
			Log.new @instruments, @demos, @matches
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
							puts "        #{instrument.person.name}'s #{instrument.name}"
						end
						if demo.space != nil
							puts "        at #{demo.space.person.name}'s #{demo.space.name}"
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
				demo.required_instruments.each do |required_instr|
					instrument_availability = AvailableTime.new []
					@instruments.each do |instr|
						instrument_availability.union! (instr.availability_for demo) if instr.name == required_instr
					end
					instrument_availability.vertex! demo.availability
					if !instrument_availability.has_contiguous? demo.duration
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
			@matches.sort {|a,b| (a.value_with @instruments, @demos, D, S, C, A) <=> (b.value_with @instruments, @demos, D, S, C, A)}
		end

		def execute match
			instrument, demo = match.unpack @instruments, @demos
			assign instrument, demo
		end

		def before_calculate
			@people.each do |person|
				person.label_instruments
				person.label_spaces
				@instruments.concat person.instruments
			end
			remove_impossible_demos
			assign_partnered_spaces
			disguise_spaces
			@saved_data[0] = Log.new @instruments, @demos, @matches
		end

		def assign_partnered_spaces
			max_name = 0
			@demos.each do |demo|
				if (s = demo.required_space) >= max_name
					max_name = demo.required_space
				end
			end

			space_types = []
			for i in 0..max_name
				space_types.unshift i
			end
			space_types.each do |name|
				space_matches = []
				@people.each do |person|
					person.spaces.each do |space|
						if space.name > name
							@demos.each do |demo|
								instrument_person_provides = false
								person.instruments.each do |instrument|									
									instrument_person_provides = instrument if demo.requires? instrument.name
								end
								if (space.name > demo.required_space) && instrument_person_provides && ((person.schedule.vertex demo.availability).has_contiguous? demo.duration)
									space_matches.push [instrument_person_provides, space, demo]
								end
							end
						end
					end
				end
				space_matches.sort! { |a,b| -((value_of_space_with a[0], a[1], a[2]) <=> (value_of_space_with b[0], b[1], b[2])) }
				space_matches.shuffle!
				while !space_matches.empty?
					instrument, space, demo = space_matches[0]
					assign instrument, demo
					demo.space = space
					index = @people.index instrument.person
					if index
						@people.delete_at index
					else
						raise " ! error: I couldn't find #{person} in #{@people}." 
					end
					space.person.spaces.remove_one space.name
					space_matches.delete_if do |i,s,d|
						(d == demo) || (s.person == space.person)
					end
				end
			end
		end

		def disguise_spaces
			@people.each do |person|
				if ((max = person.spaces.max_name))
					for n in 0..max
						s = Space.new n
						s.person = person
						person.instruments.push s
						@instruments.push s
					end
				end
				person.spaces.clear #remove this if I still need to access people's spaces
			end
			@demos.each do |demo|
				if demo.space == nil
					demo.required_instruments.push demo.required_space
				end
			end
		end

		def assignment_cycle
			remove_impossible_demos

			instruments_of_category = @instruments.called priciest_instrument
			@matches.clear

			instruments_of_category.each do |instrument|
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

		def print_best_solutions
			solution_scores = Hash.new
			@solutions.each do |log|
				instruments, demos = log.recover
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


		def calculate 
			puts "I have begun assignment..."
			before_calculate

			find_solutions 

			print_best_solutions
		end
	end
end