# this class will generate our secret number for us
class SecretNumber
	attr_accessor :secret_number

	def initialize
		@secret_number = rand(1..10)
		# this is good, and works!
		# the assignment asked you to create an array and take a sample from it - https://github.com/lindakung/BEWD-DC-1-HW/blob/d82d8f8ef7d107ef529744cefd9e7cfecd111a54/Linda_Kung/ex_secret_number_objects/secret_number_objects/main.rb#L22
		# I wonder if the rand() function creates an array and takes a sample? 
	end
end

