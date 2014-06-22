class SecretNumber
# this class will generate our secret number for us
	attr_accessor :number

	def initialize
		@number = Array(1..10).to_a.sample  
		# Make an array that goes from 1 to 10 and pick a random element from it
		# Wouldn't be better to just do @number = rand(1..10) ?
		# What's the point of the array?
	end
end