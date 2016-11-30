class Mastermind
	attr_accessor :board, :guess_count, :white_pin_arr, :red_pin_arr, :guess

	def initialize
		@board           = [1,2,3,4]
		@white_pin_arr   = Array.new
		@red_pin_arr 	 = Array.new
	end

	def guess_check(guess)
		@guess = guess
		guess = guess.split('')
		guess_arr = guess.map!{|v| v.to_i}
		
		puts guess_arr.inspect	
		no_pin_arr = guess - board

		board.each_with_index do |value, index|
			if board[index] == guess[index]
				@red_pin_arr.push(value)
			end
		end

		@white_pin_arr = guess - no_pin_arr - @red_pin_arr
	end

	def display_white_pins
		return "You have #{@white_pin_arr.length} correct digits but not in in the correct order"
	end

	def display_red_pins
		return "You have #{@red_pin_arr.length} correct digits in the correct order"	
	end
end

count = 0
#board = Array.new(4)
#code_gen(board)
#test_rig = ["blue", "blue", "green", "black"]
game = Mastermind.new

while count < 12 do
	puts "Number sequence pls:"
	guess = gets.chomp

	game.guess_check(guess)
	puts game.display_red_pins
	puts game.display_white_pins

	count += 1
end





