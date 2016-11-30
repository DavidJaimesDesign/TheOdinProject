require 'yaml'

class Game
	attr_accessor :word, :guess, :count, :name
	def initialize(word = nil, guess = nil, count = 0, name = nil)
		@word = word
		@guess = guess
		@count = count
		@name = name
	end

	def new_game
		#do we need this method? This would be dependent on hangman.rb classes and for now we don't need it to be 
	end
	# GAME DATA SHOULD BE IN A HASH
	def load_game(save_name)
		puts "Loading"
		load_hash = YAML.load_stream(File.open("game_data.yml"))  
		load_hash.each_with_index do |val, index| 
			if load_hash[index].name == save_name 
				@word = load_hash[index].word
				@guess = load_hash[index].guess
				@count = load_hash[index].count
				@name = load_hash[index].name
			end
		end
	end

	def save_game(game)
		File.open("game_data.yml", 'a+') do |file|
			file.write game.to_yaml
		end
		#save the data to yaml the name as the id and the game_data as the data
	end
end