require 'lib/person'
require 'lib/secret_number'

class Game
# this class will be complex
# we need to write logic to initialize a new game, and run the game loop
# we'll want to write a few separate methods for unique tasks so that our
# code is structured properly
	attr_accessor :secret, :player, :guesses_left

	def initialize(player_name)




	def intro
		puts "Welcome to the Secret Number game!!  Created by Jason Haas."
		puts "What is your name?"
		player_name = gets.chomp
		puts "Hi #{player_name}!!"
		puts "Guess a number between 1 and 10:"
	end

	def guess(try)
		if try == 1
			puts "You have #{try} guess left."
		else
			puts "You have #{try} guesses left."
		end
		print "\nNumber ------->"
		number = gets.chomp.to_i  # Will be set to zero if it's not a number	
		until number > 0 && number < 11 do  # Keep prompting for input until criteria is met
			puts "You didn't enter a number between 1 and 10."
			number = gets.chomp.to_i
		end
		number # return the number that was guessed
	end

	def check_number(number, secret_number)
		result = number <=> secret_number	# returns 0 if true, -1 if a < b, and +1 if a > b
		if result == 0
			puts "You guessed the number!  You're amazing!"
			abort  # Abort the program if the user guessed correctly
		elsif result == -1
			puts "Your number is too low!"
		else result == 1
			puts "Your number is too high!"
		end
	end

	# Main program
	intro()
	3.downto(1) do |try|  # Prompt for a number and check it against the secret numer
		number = guess(try)
		check_number(number, secret_number)
	end

	# If the program gets this far, the player has guessed incorrectly 3 times
	puts "You didn't guess the right number!  The correct number was #{secret_number}"

	end
end
