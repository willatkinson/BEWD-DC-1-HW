###############################################################################
#
# Back-End Web Development - Homework #1
#
# Secret Number is a game you will build in two parts.
# The purpose of the game is to have players guess a secret number from 1-10.
#
# Read the instructions below.
# This exercise will test your knowledge of Variables and Conditionals.
#
###############################################################################
#
# We're ready to program! To practice our Ruby skills lets create a secret number game. 
# In this game players have three tries to guess a secret number between 1 and 10. 
#
# Here are some guidelines to building your game:
#
#	Intros
# 	-	Welcome the player to your game. Let them know who created the game. 
#	  -	Ask for the player's name then personally greet them by printing to the screen, "Hi player_name!"
#	  -	Any good game will communicate the rules. Let the player know they must guess a number between 1 and 10 
#		and that they only have 3 tries to do so.
#
#	Functionality: 
#	 -	Hard code the secret number. Make it a random number between 1 and 10.
#	 - 	Ask the user for their guess.
#	 -	Verify if they were correct. If the player guesses correctly they win the game they should be congratulated and the game should end.
#	 -	If they guess incorrectly, give the player some direction. If they guess too high let them know, if they guess too low, let them know.
#	 - 	Don't forget to let your players know how many guesses they have left. Your game should say something like
#		  "You have X many guesses before the game is over enter a another number"
#	 -	If they don't guess correctly after 3 tries, print that the Player lost and the game is over. Also let them know what the `secret_number` was.
#
# Make sure to add helpful comments to your code to document what each section does.
# 
# Remember to cast input from the Player into the appropriate data type.
#
###############################################################################

secret_number = rand(1..10)	# Made it a random number rather than fixed

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
