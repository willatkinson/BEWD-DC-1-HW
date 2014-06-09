class Display

	def initialize
	end

	def start
		puts "How would you like to find parties?"
		puts "1.  Category"
		puts "2.  City"
		puts "3.  Region"
		puts "4.  Postal code"
		puts "5.  Event start date"
		GetInput.new
	end
end