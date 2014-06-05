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
    
    puts "Hello and welcome to my secret number game. My name is Aji, the creator of this game"
    puts "What is your name?"
    name = gets.chomp.capitalize
    puts "Hi " + name + "!"
    puts " These are the rules to my game!"
    puts "I've chosen a number from 1 to 10!"
    puts "And you have only 3 guesses to guess what that number is!"
    puts "Ready? Let us get started!"
 
 
 	secret_number = 6
 	guesses_left = 3


 	

while guesses_left >= 1

 puts " What's your guess?"
 player_guess = gets.chomp.to_i


	if player_guess == secret_number 
		puts "Congratz! You guessed the secret number! You win!"
		break
	 elsif player_guess > secret_number 
	    puts " Sorry,you have guessed too high"
	    guesses_left = guesses_left - 1
	elsif player_guess < secret_number 
        puts "Sorry you have guessed too low"
        guesses_left = guesses_left - 1
	end

	if guesses_left == 0
		puts " Sorry you are out of guesses. The secret number was #{secret_number}."
	else
		puts  "You have #{guesses_left} many guesses before the game is over enter a another number"
	end	

	

end




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

