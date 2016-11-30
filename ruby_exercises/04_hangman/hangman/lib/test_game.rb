require 'yaml'
require_relative 'game'

test = Game.new
test.load_game("test2")
puts test.name
puts test.count
puts test.guess
puts test.word