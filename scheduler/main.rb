module TW2
	require_relative 'available_time'

	SAVING_INFREQUENCY = 4
	$d = 10
	$c = 1
	$a = 1

	def price_of instrument  #price is the difference between an instrument's demand and supply (price = demand - supply)
		demos.demand instrument - instruments.supply instrument
	end

	def priciest_instrument #returns a name
		types = Hash.new 
		instruments.each do |instrument|
			types[instrument.name] ||= 0
			types[instrument.name] += price_of instrument 
		end

		return (types.sort {|a,b| -(a[1]<=>b[1]) ).first.first #the second ".first" extractes the instrument name from the [name,price] array.
	end

	def demos_fulfilled_or_removed
		demos.each do |demo|
			return false unless demo.closed? || demo.required_instruments.empty? #I will remove this line if I do not end up using the "@closed" model.
		end
		return true
	end

	def print_solution 
				puts "Solution: "
		demos.each do |demo|
				puts "    #{demo.name}:"
			demos.instruments.each do |instrument|
				puts "        #{instrument.person.name}'s #{instrument},"
			end
		end
	end



	instruments = InstrumentCollection.new
	instruments_of_category = []
	demos = DemoCollection.new
	matches = []
	saved_data = []
	#assign_table = AssignmentTable.new
	#assign_tables = AssignmentTableCollection.new

	# def instrument_demo_overlap #precondition: the instruments_of_category for this assignment has been chosen.
	# 	instruments_of_category.each do |instrument|

	# 	end
	# end

	def remove_impossible_demos
		to_remove = []
		demos.each do |demo|
			demo.required_instruments.each do |required_instr|
				instrument_availability = AvailableTime.new
				instruments.each do |instr|
					instrument_availability = instrument_availability.union instr.availability_for demo
				end
				if !instrument_availability.has_contiguous? demo.duration
					to_remove.push demo 
				end
			end
		end
		to_remove.each do |demo|
			demo.instruments.each do |instrument|
				instruments.concat instrument.person.instruments
			end
			demos.delete demo
		end
	end

	def assign instrument, demo
		#assign_table.assign instrument, demo
		demo.availability.vertex! instrument.person.schedule
		instruments.remove_of instrument.person
		demo.remove_requirement instrument.name
		demo.instruments.push instrument
	end

	def sort_matches_by_value
		matches.sort {|a,b| a.value_with instruments, demos <=> b.value_with instruments, demos}
	end

	def execute match
		instrument, demo = match.unpack instruments, demos
		assign instrument, demo
	end

	def assignment_cycle
		remove_impossible_demos

		instruments_of_category = instruments.called priciest_instrument
		matches.clear

		instruments_of_category.each do |instrument|
			demos.each do |demo|
				matches.push Match.new instrument, demo
			end
		end

		sort_matches_by_value

		execute matches.first
	end

	def find_solutions
		save_timer = SAVING_INFREQUENCY

		while !demos_fulfilled_or_removed
			assignment_cycle

			save_timer -= 1
			if save_timer == 0 
				save_timer = SAVING_INFREQUENCY
				saved_data.push Log.new instruments, demos, matches
			end
		end

		print_solution

		recover_log
	end

	def recover_log
		if !((log = saved_data[0]))
			puts "I have found all matches."
		else
			instruments, demos, next_match = log.recover
			if (instruments && demos && next_match) #prune for efficiency here.
				execute next_match
				find_solutions
			else 
				saved_data.pop
				recover_log
			end
		end
	end

	assignment_cycle
	saved_data[0] = Log.new instruments, demos, matches
	find_solutions

	# def log_solution
	# 	#assign_tables.push assign_table.deep_clone
	# 	order_matches_by_value
	# 	saved_data.push Log.new instruments, demos, matches
	# end

end