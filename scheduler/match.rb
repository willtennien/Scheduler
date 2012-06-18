class TW2
	class Match #A Match shouldn't be able to be altered; no methods or accessors should be able to alter a Match.
		def initialize instrument, demo
			@instrument_name = instrument.name
			@instrument_person_name = instrument.person.name
			@demo_name = demo.name
		end

		def to_s
			return "#{@instrument_person_name}'s @{instrument_name} is assigned to #{demo_name}."
		end

		def value_with instruments, demos
			instruments.each do |i|
				if (i.name == instrument_name) && (i.person.name == instrument_person_name)
					instrument = i
					break
				end
			end

			instrument_availability_elsewhere = 0
			demos.each do |d|
				if d.name == demo_name
					demo = d
				else
					instrument_availability_elsewhere += instrument.availability_for d
				end
			end

			unless instrument && demo
				raise " ! error: #{self} cannot find either #{instrument_person_name}'s #{instrument_name} or #{demo_name}."
			end

			return (-$d*demo.required_instruments + $c*demo.required_instruments*(instrument.availability_for demo).magnitude - $a*instrument_availability_elsewhere)
		end

		def unpack instruments, demos
			instruments.each do |i|
				if (i.name == instrument_name) && (i.person.name == instrument_person_name)
					instrument = i
					break
				end
			end

			demos.each do |d|
				if d.name == demo_name
					demo = d
					break
				end
			end

			return [instrument,demo]
		end
	end
end