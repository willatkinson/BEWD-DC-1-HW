require 'lib/person'
require 'lib/secret_number'

class Game
# this class will be complex
# we need to write logic to initialize a new game, and run the game loop
# we'll want to write a few separate methods for unique tasks so that our
# code is structured properly
	attr_accessor :secret, :player, :try

	def initialize(player_name)
		@player = Person.new(player_name)
		@secret = SecretNumber.new
		@try = 3
	end

	def start
		puts "\nGuess a number between 1 and 10:"

		while @try > 0
			guess
			check_number
			break if @number == @secret.number
			@try -= 1
		end
		if @try == 0
			# If the program gets this far, the player has guessed incorrectly 3 times
			puts "You didn't guess the right number!  The correct number was #{@secret.number}"
		end
	end

	def guess
		if @try == 1
			puts "You have #{@try} guess left."
		else
			puts "You have #{@try} guesses left."
		end
		print "\nNumber ------->"
		@number = gets.chomp.to_i  # Will be set to zero if it's not a number	
		until @number > 0 && @number < 11 do  # Keep prompting for input until criteria is met
			puts "You didn't enter a number between 1 and 10."
			@number = gets.chomp.to_i
		end
	end

	def check_number
		result = @number <=> @secret.number	# returns 0 if true, -1 if a < b, and +1 if a > b
		if result == 0
			puts "You guessed the number!  You're amazing!"
		elsif result == -1
			puts "Your number is too low!"
		else result == 1
			puts "Your number is too high!"
		end
	end
end
