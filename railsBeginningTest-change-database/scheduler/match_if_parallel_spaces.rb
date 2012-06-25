module TW2
	class Match #A Match shouldn't be able to be altered; no methods or accessors should be able to alter a Match.
		def initialize item, demo
			@item_name = item.name
			@person_name = item.person.name
			@demo_name = demo.name
		end

		def to_s
			return "<Match: #{@person_name}'s #{@item_name} is assigned to #{@demo_name}>"
		end

		def value_with items, demos, dconst, sconst, cconst, aconst
			item, demo = nil, nil
			items.each do |i|
				if (i.name == @item_name) && (i.person.name == @person_name)
					item = i
					break
				end
			end

			item_availability_elsewhere = 0
			demos.each do |d|
				if d.name == @demo_name
					demo = d
				else
					item_availability_elsewhere += (item.availability_for d).magnitude
				end
			end

			unless item && demo
				raise " ! error: #{self} cannot find either #{@person_name}'s #{@item_name} or #{@demo_name}."
			end

			return (-dconst*demo.required_instruments.length - sconst*demo.required_space_quality + cconst*demo.required_instruments.length*(item.availability_for demo).magnitude - aconst*item_availability_elsewhere)
		end

		def unpack items, demos
			item, demo = nil, nil
			items.each do |i|
				if (i.name == @item_name) && (i.person.name == @person_name)
					item = i
					break
				end
			end

			raise " ! error: #{self} cannot find #{@person_name}'s \"#{@item_name.inspect}\" in #{items}." unless item

			demos.each do |d|
				if d.name == @demo_name
					demo = d
					break
				end
			end

			raise " ! error: #{self} cannot find \"#{@demo_name.inspect}\" in #{demos}." unless demo

			return [item,demo]
		end
	end
end