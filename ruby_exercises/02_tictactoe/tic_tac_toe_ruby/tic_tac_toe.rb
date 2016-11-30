new_game = Array.new(9, nil)

def display_board(board)
	puts board[0].to_s + " | " + board[1].to_s  + " | " + board[2].to_s 
	puts board[3].to_s + " | " + board[4].to_s  + " | " + board[5].to_s 
	puts board[6].to_s + " | " + board[7].to_s  + " | " + board[8].to_s 
end

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

puts "Decide amongst yourselves who will go first X always goes first"
puts "To make a move simply state where in the graph you want you piece"
puts "For example top left is 0 its a 9 block array basically pretty noob but cut me some slack"

while victory_conditions(new_game, "X") == false || victory_conditions(new_game, "O") == false || new_game.all? == false do 
	puts "X your turn"
	place_x = gets.chomp.to_i
	move(new_game, place_x,"X")
	display_board(new_game)
		if victory_conditions(new_game,"X")
			break
			put "X won noob"
		end
	puts "O your turn"
	place_o = gets.chomp.to_i
	move(new_game, place_o,"O") 
	display_board(new_game)
		if victory_conditions(new_game,"O")
			put "O won noob"
			break
		end
end 
