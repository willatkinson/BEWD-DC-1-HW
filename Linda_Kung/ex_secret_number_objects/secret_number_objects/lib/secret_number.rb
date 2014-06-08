# this class will generate our secret number for us
class SecretNumber
	attr_accessor :secret_number

	def initialize
		@secret_number = rand(1..10)
	end
end

