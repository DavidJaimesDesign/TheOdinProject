module Enumerable

	def my_each(&block)
		return enum_for(:my_each) unless block_given?
		i = 0
		while i < self.length
			yield self[i]
			i += 1
		end
		self
	end

	def my_each_with_index(&block)
		return enum_for(:my_each_with_index) unless block_given?
		i = 0
		self.my_each do |x|
			yield i, x
			i += 1
		end
		self
	end

	def my_select(&block)
		return enum_for(:my_select) unless block_given?
		new_arr = []
		self.my_each do |x|
			block = yield x
			if block == true
				new_arr.push(x)
			end 
		end
		new_arr
	end

	def my_all?(&block)
		if block_given?
			self.my_each do |x|
				block = yield x
				if block == false || nil
					return false
					break
				else
					return true
				end
			end
		else
			self.my_each do |x|
				return false if x == false # I know it should be dry but || was not working and I have no idea why.
				return false if x == nil
			end
			true
		end
	end

	def my_any?(&block)
		if block_given?
			any_arr = self.my_select{|x| yield x}
			return false if any_arr.empty?
			return true
		else
			any_arr = self.my_select{|obj| obj}
			if any_arr.empty?
				return false
			else
				return true
			end
		end
	end

	def my_none?(&block)
		if block_given?
			return false if self.my_any?{|x| yield x}
			return true 
		else 
			return false if self.my_any?
			return true
		end
	end

	def my_count(&block)
		if block_given?
			count_arr = self.my_select{|x| yield x}
			return count_arr.length 
		else
			self.length
		end
	end

	def my_map(&block)
		return enum_for(:my_map) unless block_given?
		map_arr = []
		self.my_each do |x|
			map_arr.push(yield x)
		end
		return map_arr
	end

	def my_inject(sum = nil)
		return enum_for(:my_map) unless block_given?
		a = 0 
		if sum == nil
			sum = self.first
			a = 1
		end
		for i in self.drop(a)
			sum = yield(sum, i)
		end
		return sum
	end

end

def multiply_els(arr)
	return arr.my_inject{|x,y| x * y}
end
["a", "b", "c", "d"].my_each_with_index{|index, value| print "#{index}: #{value}"}


