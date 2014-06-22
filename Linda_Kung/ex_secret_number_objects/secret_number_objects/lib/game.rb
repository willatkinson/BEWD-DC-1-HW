require 'lib/person'
require 'lib/secret_number'


class Game

	attr_accessor :player, :secret_number, :guesses

	def initialize(player_name)
		@player = Person.new(player_name)
		@secret_number = SecretNumber.new
	end

	def startgame
		puts "#{@player.player_name}, you have three tries to guess the Secret Number between 1 and 10."
		puts "Take your first guess!"
		secret_number_game
	end

	def secret_number_game

		3.downto(1) do |guesses|
		# this is really good. If you wanted to give the player the option to
		# play again after their three guesses, do you know how you could do that?

		guess = gets.chomp.to_i

		if guess == @secret_number.secret_number
			puts "Nice job #{guess} is the Secret Number! You win (:"
				break
		elsif guess < @secret_number.secret_number && guesses > 1 
			puts "Too low..try again. You have #{guesses-1} guesses left."
		elsif guess > @secret_number.secret_number && guesses > 1
			puts "Too high..try again. You have #{guesses-1} guesses left."
		else
			puts "Sorry, you lose. The Secret Number was #{@secret_number.secret_number}."
		end

	end

end

end






# this class will be complex
# we need to write logic to initialize a new game, and run the game loop
# we'll want to write a few separate methods for unique tasks so that our
# code is structured properly


