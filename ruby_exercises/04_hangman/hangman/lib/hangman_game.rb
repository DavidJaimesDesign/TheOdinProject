require_relative 'hangman'
require_relative 'game'
require 'yaml'

def new_or_load(response)
	if response == "new"
		puts "You have guesses before someone dies..."
		source = Words.new("5desk.csv")
		word = Word.new
		word_hangman = word.hangman_word(source)

		guess = Guess.new(word_hangman)
		guess.generate
		guess.display

		count = 0

		while count <= 6 do 
			puts "Letter pls"
			puts "Save game? type in save"
			letter = gets.chomp 
			if letter == "save"
				puts "name for new save?"
				name = gets.chomp
				save_guess = guess.save
				new_save = Game.new(word_hangman, save_guess, count, name)
				new_save.save_game(new_save)
				puts "GAME SAVED"
				count -= 1
			end
			guess.guess_check(letter)
			guess.display
			guess.guess_message(count)
			count += 1
		end

		if count == 6
			puts "Death comes for us all in the end..."
		end
	elsif response == "load"
		puts "Name of of the saved game pls?"
		name = gets.chomp
		load = Game.new
		load.load_game(name)
		guesses_left = 6 - load.count

		puts "You have #{guesses_left} guesses before someone dies..."
		word_hangman = load.word

		guess = Guess.new
		guess.guess_load(load.guess, load.word)
		guess.display 

		count = load.count

		while count <= 6 do 
			puts "Letter pls"
			puts "Save game? type in save"
			letter = gets.chomp 
			if letter == "save"
				puts "name for new save?"
				name = gets.chomp
				new_save = Game.new(word_hangman, guess, count, name)
				new_save.save_game(new_save)
				puts "GAME SAVED"
				count -= 1
			else 
				guess.guess_check(letter)
				guess.display
				guess.guess_message(count)
				if 	guess.guess_check(letter) == true
					count += 1
				end
			end
		end


		if count == 6
			puts "Death comes for us all in the end..."
		end

	else 
		puts "Please put new or save mind the caps there are none"
	end
end

puts "Its Hang man tiem!"
puts "New game or load a game? put in load or new then hit enter"
response = gets.chomp
new_or_load(response)
