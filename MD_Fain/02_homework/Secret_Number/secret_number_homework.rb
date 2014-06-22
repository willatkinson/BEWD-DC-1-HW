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

secret_number = 8
def get_input 
	gets.chomp
end

puts "Welcome to the game, it's called the 'Secret Number Game'. My name is Mary Dorothy, nice to meet you"
puts 'What is your name?'
player = get_input
puts "Hi #{player}, The rules of the game are simple. You have to guess a number between 1 and 10 and you only have three guesses."


3.downto(1) do |guess|
	puts 'Guess a number :) '
	player_guess = get_input.to_i

	if player_guess == secret_number
		puts "you're right, you're awesome!"
		break if player_guess == secret_number
	elsif player_guess < secret_number &&  guess > 1
		puts "too low, guess higher, you have #{guess-1} guesses left"

	elsif player_guess > secret_number && guess > 1
		puts "too high, guess lower, you have #{guess-1} guesses left"
	else 
		puts "no more guesses, game over"
	end	
end



# def fizzbuzz(number)
#   response = ''
#   response += 'fizz' if number % 3 == 0
#   response += 'buzz' if number % 5 == 0
#   return response if !response.empty?
#   number
# end
 
# 1.upto(100) do |num|
#   puts fizzbuzz(num)
# end

# secret_number = 8
# def get_input
# 	gets.chomp
# end

# puts "Welcome to the game, it's called the 'Secret Number Game'. My name is Mary Dorothy, nice to meet you"
# puts 'What is your name?'
# player = get_input
# puts "Hi #{player}, The rules of the game are simple. You have to guess a number between 1 and 10 and you only have three guesses."

# 	3.downto(1) do |guesses|
# 	 puts 'Guess a number'
# 	 guess = get_input.to_i
# 		if guess == secret_number
# 	 		puts "yes, you're right"
# 	 		break
# 		end
# 	end


