def bubble_sort(arr)
	n = arr.length 
	swapped = true
		while swapped do
			swapped = false
			0.upto(arr.length - 2) do |i|
				if arr[i] > arr[i+1]
					arr[i], arr[i+1] = arr[i+1],arr[i]
					swapped = true
				end
			end
		end
	 return arr
end

def bubble_sort_by(arr)
	n = arr.length 
	swapped = true
		while swapped do
			swapped = false
			0.upto(arr.length - 2) do |i|
				if yield(arr[i], arr[i+1]) > 0
					arr[i], arr[i+1] = arr[i+1],arr[i]
					swapped = true
				end
			end
		end
	 return arr
end
	

#bubble_sort_by(["hi", "hello", "hey"]) do |left, right|
#	left.length - right.length
#end
#git test
