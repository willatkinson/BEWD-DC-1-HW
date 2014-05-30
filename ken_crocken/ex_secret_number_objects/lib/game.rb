require 'lib/person'
require 'lib/secret_number'

class Game

# this class will be complex
# we need to write logic to initialize a new game, and run the game loop
# we'll want to write a few separate methods for unique tasks so that our
# code is structured properly

  attr_accessor :secret, :guesses, :guess, :player, :messages

  def initialize (name)

    @secret = SecretNumber.new
    @guesses =  3
    @guess = guess
    @player = Person.new(name)
    # @messages = {
    #   win:    "Winner! Winner! The Secret Number was #{@secret.number}. Well done!",
    #   higher: "Nope, that's not the Secret Number.  Guess higher!",
    #   lower:  "Sorry, you guessed wrong.  Guess lower!",
    #   lose:   "You are out of guesses.  You lose.  The Secret Number was #{@secret.number}."
    # }
    @wins = 0
    @losses = 0

  end

  def instructions

    system "clear"
    puts "Hi #{@player.name}!  Thanks for playing the Secret Number.  Let's go over the rules before we play."
    puts "I have chosen a secret number that is between 1 and 10."
    puts "Your goal is to guess the secret number within 3 guesses."
    puts "Simple, right? Great, let's play!\n \n"

    start

  end

  def start

    while @guesses != 0
      player_guess
    end

  end

  def player_guess

    puts "Guesses left: #{@guesses}"
    puts "What is your guess?"
    @guess = gets.to_i

    @guesses -= 1
    
    check_number(@guess)

  end

  def check_number(guess)

    if guess == secret.number  
        #puts "#{@messages[:win]} \n \n"  
        puts "Winner! Winner! The Secret Number was #{@secret.number}. Well done!\n\n"
        @wins += 1
        play_again
    elsif guess < secret.number && @guesses > 0
        # puts "#{@messages[:higher]} \n \n" 
        puts "Nope, that's not the Secret Number.  Guess higher!\n\n"
    elsif guess > secret.number && @guesses > 0
        # puts "#{@messages[:lower]} \n \n" 
        puts "Sorry, you guessed wrong.  Guess lower!\n\n"
    else
        # puts @messages[:lose] 
        puts "You are out of guesses.  You lose.  The Secret Number was #{@secret.number}.\n\n"
        @losses += 1
        play_again
    end
  end

  def play_again

    puts "Would you like to play again? (y/n)"
    again = gets.chomp.capitalize

      if again != "Y"
        puts "\nYou won #{@wins} games and lost #{@losses} games. \n \n"
        abort("\nThanks for playing!")
      else 
        puts "\nLet's do this!\n \n"
        puts "You have #{@wins} wins and #{@losses} losses. \n"
        @secret = SecretNumber.new
        @guesses = 3
      end

  end

end
