module TW2
	class AvailableTime
		attr_reader :value

		def initialize *v
			if v.length == 0
				@value = []
			if (v.length == 1) && (v[0].length != 2)
				@value = v[0]
			else
				@value = v
			end
		end

		# def deep_clone
		# 	result = []
		# 	@value.each do |period|
		# 		result.push period.clone
		# 	end
		# 	return result
		# end

		def to_s
			result = "<AvailableTime: "
			@value.each do |start,finish|
				result << "#{start}-#{finish}, "
			end
			result = result[0..-3] + ">"
		end

		def magnitude
			sum = 0
			@value.each do |start,finish|
				sum += finish - start
			end
			return sum
		end

		def has_contiguous? time
			each do |a|
				if a.magnitude >= time
					return true
				end
			end
			return false
		end

		def max a, b
			if a < b
				return b
			else 
				return a
			end
		end

		def min a, b
			if a < b
				return a
			else
				return b
			end
		end

		def vertex! other
			@value = (self.vertex other).value
		end

		def vertex other
			as = self.value.clone
			bs = other.value.clone
			a = as.shift
			b = bs.shift
			v = []
			until a.nil? || b.nil? 
				if (a[0] <= b[0]) && (b[0] < a[1])
					if a[1] < b[1]
						v.push [b[0],a[1]]
					else 
						v.push [b[0],b[1]]
					end
				elsif (b[0] <= a[0]) && (a[0] < b[1])
					if a[1] < b[1]
						v.push [a[0],a[1]]
					else 
						v.push [a[0],b[1]]
					end
				end

				if (a[1] <= b[1])
					a = as.shift
				elsif (b[1] <= a[1]) 
					b = bs.shift
				else 
					raise " ! error: logic has failed in the elsif chain of #{self}.vertex."
				end
			end
			return AvailableTime.new v
		end

		def union! other
			@value = (self.union other).value
		end

		def union other
			as = self.value.clone
			bs = other.value.clone
			if ((a = as.shift))
				u = [a]
			else
				return u.replace bs
			end 
			a = as.shift
			b = bs.shift
			until a.nil? || b.nil? 
				if a[1] <= b[1]
					r = a
				elsif b[1] <= a[1]
					r = b
				else
					raise " ! error: logic has failed in the elsif chain of #{self}.union."
				end

				l = u.last
				if l[1] < r[0]
					u.push r
				else
					u[-1] = [min(l[0],r[0]) , max(l[1],r[1])]
				end


				if r == a
					a = as.shift
				elsif r == b
					b = bs.shift
				else
					raise " ! error: logic has failed in the equality elsif chain of #{self}.union."
				end
			end

			if a
				r = a
				rs = as
			else
				r = b
				rs = bs
			end

			until r.nil?
				l = u.last
				if l[1] < r[0]
					u.push r
				else
					u[-1] = [min(l[0],r[0]) , max(l[1],r[1])]
				end

				r = rs.shift
			end

			return AvailableTime.new u
		end
	end
end