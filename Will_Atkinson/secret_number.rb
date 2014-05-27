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

# welcome screen
puts '+---------------------------------+'
puts '|  Welcome to Secret Number v1.0  |'
puts '|                                 |'
puts '|                                 |'
puts '|    Created by Will Atkinson     |'
puts '|                                 |'
puts '+---------------------------------+'
puts ''

# input name
puts 'Please enter your name: '
name = gets.chomp
puts ''
puts 'Hello ' + name + '!'
puts ''
puts 'INSTRUCTIONS: 2 rules -' 
puts '1. Guess a number between 1 and 10.'
puts '2. You have three tries.'

# generate a random number
random_num = rand(10) + 1

# i is the counter for guesses
i = 3

# loop that asks for three numbers and compares them against the random number
while true && i > 0
	puts ''
		puts 'You only have ' + i.to_s + ' guesses left. Choose wisely.'
		puts 'Guess a number: '
		guess = gets.to_i
		# when user guesses the correct number
		if guess == random_num
			puts ''
			puts 'YOU WIN!!!! We\'d do a balloon drop but we\'re already over budget.'
			puts ''
			break
		# user guesses a number lower than the random number
		elsif guess < random_num
			puts ''
			puts 'TOO LOW!'
		# user guesses a nnumber higher than the random number
		elsif guess > random_num
			puts ''
			puts 'TOO HIGH!'
		end
		puts ''
		i -= 1
end

# lost game message. only displayed if the user guess wrong 3 times
if i == 0
	puts 'YOU LOST! The correct number was ' + random_num.to_s + '. Better luck next time.'
end