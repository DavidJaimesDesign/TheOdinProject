def move(arr, square, value)
	arr[square] = value
end

def victory_conditions(arr, value)
	if arr[0] == value && arr[1] == value && arr[2] == value
		true
	elsif arr[3] == value && arr[4] == value && arr[5] == value
		true
	elsif arr[6] == value && arr[7] == value && arr[8] == value
		true
	elsif arr[0] == value && arr[3] == value && arr[6] == value
		true
	elsif arr[1] == value && arr[4] == value && arr[5] == value
		true
	elsif arr[2] == value && arr[5] == value && arr[8] == value
		true
	elsif arr[0] == value && arr[4] == value && arr[8] == value
		true
	elsif arr[6] == value && arr[4] == value && arr[2] == vlaue
		true
	else
		false
	end
end
