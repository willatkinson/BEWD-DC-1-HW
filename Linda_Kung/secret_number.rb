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

# The Secret Number is 8
# Input player's name

#Set method to allow player to input name

def input_name
	name = gets.chomp
end

#Hard code the secret number
def secret_number
	number = '8'
end

#Method for player's first guess
def number1(first_guess)
	first_guess = gets.chomp

	if first_guess == secret_number
		puts "Nice job, #{first_guess} is correct. You win Secret Number!"
	else 
		puts "#{first_guess} is not correct. You have two guesses left. Try again!"
		second_guess = number2(second_guess)
	end

end 


#Method for player's second guess if applicable
def number2(second_guess)
	second_guess = gets.chomp

	if second_guess == secret_number
		puts "Yes, #{second_guess} is correct. You win Secret Number!"
	else
		puts "#{second_guess} is not correct either. You have one more guess."
		last_guess = number3(last_guess)
	end

end 

#Method for player's third guess if applicable
def number3(last_guess)
		last_guess = gets.chomp

	if last_guess == secret_number
		puts "Yup, #{last_guess} is the Secret Number. You win Secret Number!"
	else 
		puts "#{last_guess} is not correct. Sorry, you lose the game..the Secret Number was 8."
	end

end 

puts "Welcome to Secret Number!"
puts "What is your name?"
name = input_name
puts "Hi #{name}!"
puts "#{name}, these are the rules of Secret Number:"
puts "You have to guess the Secret Number."
puts "You must guess a number between 1 and 10..."
puts "but you only have 3 tries to do so."
puts "Are you ready? Let's start:"
puts "Take your first guess"
first_guess = number1(first_guess) 





#
#	Functionality: 
#	 -	Hard code the secret number. Make it a random number between 1 and 10.
#	 - 	Ask the user for their guess.
#	 -	Verify if they were correct. If the player guesses correctly they win the game they should be congratulated and the game should end.
#	 -	If they guess incorrectly, give the player some direction. If they guess too high let them know, if they guess too low, let them know.
#	 - 	Don't forget to let your players know how many guesses they have left. Your game should say something like
#		  "You have X many guesses before the game is over enter a another number"
#	 -	If they don't guess correctly after 3 tries, print that the Player lost and the game is over. 
#Also let them know what the `secret_number` was.
#
# Make sure to add helpful comments to your code to document what each section does.
# 
# Remember to cast input from the Player into the appropriate data type.
#
###############################################################################

