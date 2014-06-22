require 'lib/person'
require 'lib/generate_secret_number'

class Engine
	attr_accessor :guess

	def initialize
		@guess = guess
	end

	def make_secret_number
		@random_num = GenerateSecretNumber.new.generate_secret_number
    end

	def player_guess
		puts "ENTER GUESS:"
		@guess = gets.to_i
	end

	def gameplay		
		if guess.to_i == @random_num.to_i
			puts ''
			puts 'YOU WIN!!!! We\'d do a balloon drop but we\'re already over budget.'
			puts ''
		elsif guess.to_i == 0
			puts "Invalid input." 
		elsif guess.to_i > 10
			puts "Invalid input."
		elsif guess.to_i > @random_num.to_i
			puts ''
			puts 'TOO HIGH!'
		elsif guess.to_i < @random_num.to_i 
			puts ''
			puts 'TOO LOW!'
		end
	end

	def play_the_game
		make_secret_number
		3.downto(1) do |num|
		puts "You have #{num} guesses left."
		player_guess
		gameplay
		break if @guess.to_i == @random_num.to_i
		end
		unless @guess.to_i == @random_num.to_i
		puts "You chose poorly. The correct number was #{@random_num}. Better luck next time."
	end
	end
end

generate_secret_number = GenerateSecretNumber.new