class GetInput
	attr_accessor :selection

	def initialize
		print "\n Selection ------->"
		@selection = gets.chomp.to_i  # Will be set to zero if it's not a number	
		until @selection >= 1 && @selection <= 5 do  # Keep prompting for input until criteria is met
			puts "You didn't enter a a valid selection"
			@selection = gets.chomp.to_i
		end
	end
end