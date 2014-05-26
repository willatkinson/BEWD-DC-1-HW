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

def invalid x
	x = x.to_i
	if x==1 || x==2 || x==3 || x==4 || x==5 || x==6 || x==7 || x==8 || x==9 || x==10
		return false
	end
	true
end

def guess_plural x
	if x==1
		return "guess"
	end
	"guesses"
end

puts "Welcome to the Secret Number game, built by HipHoff!"
puts "What is your name?"
player_name = gets.chomp
puts "Hi, #{player_name}\nYou have three tries to guess the secret number, which is an integer between 1 and 10."
secret = (1+rand(10)).to_s
fails = 0

while fails < 3
	puts "What is your guess for the secret number?"
	guess = gets.chomp
	if invalid(guess)
		puts "Please enter a number between 1 and 10."
		next
	end
	if guess==secret
		puts "Congratulations!  You guessed the secret number."
		break
	end
	if guess.to_i > secret.to_i
		fails += 1
		puts "You guessed too high.\nYou have #{3-fails} #{guess_plural(3-fails)} remaining."
	end
	if guess.to_i < secret.to_i
		fails += 1
		puts "You guessed too low.\nYou have #{3-fails} #{guess_plural(3-fails)} remaining."
	end
end

puts "Sorry!  You lost.  The secret number was #{secret}."

		
		