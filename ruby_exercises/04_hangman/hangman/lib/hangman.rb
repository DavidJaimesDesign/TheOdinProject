require 'csv'

class Words
	attr_accessor :words
	def initialize(source)
		@words = CSV.open source.to_s
	end
	def hangman_words
		hangman_array = []
		words.each do |row|
			word = row[0]
			hangman_array.push(word)
		end
		hangman_array.delete_if{|word| word.length < 5 || word.length > 12}
		hangman_array
	end
end

class Word
	attr_accessor :word, :source, :letter
	def initialize(word = "")
		@word = word
	end

	def hangman_word(source)
		hangman_words = source.hangman_words
		word = hangman_words[rand(hangman_words.length)]
	end
end

class Guess
	#generates the guess array from a word
	@@guess_var = Array.new  
	@@guess_count = 0

	attr_accessor :word, :guess_var
	def initialize(word = "")
		@word = word	
	end

	def generate
	 	#generates the guess array if there hasnt already been one generated
	 	if @@guess_var.empty?
	 		(word.to_s.length).times { @@guess_var.push("_") }
	 	end
	end

	def display
		@@guess_var.each{|val| print " #{val} "}
		puts ""
	end

	def test_display
		test = @@guess_var
		puts test.inspect
	end

	def save
		save_arr = Array.new
		save_arr = @@guess_var
		save_arr
	end

	def guess_load(array, word)
		@@guess_var = array
		@word = word
	end

	def guess_check(letter)
		arr = word.split("")
		if arr.any?{|value| value == letter}
			#displays the updated lines
			arr.each do |value| 
				if value == letter
					@@guess_var[arr.index(letter)] = letter
				end
			end
		else
			false
		end
	end

	def guess_message(count)
		case count
		when 0
			true
		when 1
			puts "5 guesses left the head is in the noose"
		when 2
			puts "4 guesses left the body of the chose is shown"
		when 3 
			puts "3 guesses left they stand on the platform"
		when 4 
			puts "2 guesses left they raise their hands in fear"
		when 5 
			puts "1 guess left you can see the fear in thier face and death looks into them"
		when 6
			puts "A rope goes taught and another life ends..."
		else
			puts "Error guess number exceeded"
		end
	end
end

