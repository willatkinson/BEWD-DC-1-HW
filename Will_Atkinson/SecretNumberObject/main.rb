######
# Will Atkinson's Object Secret Number Game
######

$:.unshift (File.dirname(__FILE__))
require 'lib/engine'
Engine = Engine.new
puts " __   ___  __   __   ___ ___                     __   ___  __  
/__` |__  /  ` |__) |__   |     |\\ | |  |  |\\/| |__) |__  |__) 
.__/ |___ \\__, |  \\ |___  |     | \\| \\__/  |  | |__) |___ |  \\ "

def input_name
	puts "What is your name?"
	user = gets.chomp
	Person.new(user)
end
puts ''
puts "Hi #{input_name.user}!"
puts ''
puts 'INSTRUCTIONS: 2 rules -' 
puts '1. Guess a number between 1 and 10.'
puts '2. You have three tries.'



Engine.play_the_game