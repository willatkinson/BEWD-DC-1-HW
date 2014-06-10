def guess_plural x
	if x==1
		return "guess"
	end
	"guesses"
end

class Game
	attr_accessor :fails, :secret, :currentguess, :player
		def initialize(player)
			@fails = 0
			@player = player
		end

		def pickanumber
			secret = SecretNumber.new
			@secret = secret.fill_arr.number
		end

		def guess
			while @fails < 3
				puts "What is your guess for the secret number, #{@player.name}?"
				@currentguess = gets.chomp
				if @currentguess.to_i==@secret.to_i
					puts "Congratulations, #{@player.name}!  You guessed the secret number."
					break
				elsif @currentguess.to_i > @secret.to_i
					@fails += 1
					puts "You guessed too high.\nYou have #{3-@fails} #{guess_plural(3-fails)} remaining."
				elsif @currentguess.to_i < @secret.to_i
					@fails += 1
					puts "You guessed too low.\nYou have #{3-fails} #{guess_plural(3-fails)} remaining."
				end
			end
		
		 	if @fails==3
				puts "Sorry!  You lost.  The secret number was #{secret}."
			end
 		end

		def self.play(player)
			instance = Game.new(player)
			instance.pickanumber
			instance.guess
		end

end
