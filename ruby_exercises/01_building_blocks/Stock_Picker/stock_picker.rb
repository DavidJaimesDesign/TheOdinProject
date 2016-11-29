def stock_picker(prices)
	@prices = prices
	@max_delta = 0
	prices.each_with_index do |num, idx|
		prices.each do |i|
			@delta = num - i 
				if (@delta <= @max_delta) && (idx < prices.rindex(i))
					@difference_array = [] << @delta
					$difference = [idx, prices.rindex(i)]
					@max_delta = @delta
				end
		end
	end
	if @difference_array.nil?
		puts "The stock should be bought and sold at [0,1]"
	else 
		puts "The stock should be bought and sold at #{$difference}"
	end
end

stock_picker([1,2,3])
stock_picker([17,3,6,9,15,8,6,1,10])
