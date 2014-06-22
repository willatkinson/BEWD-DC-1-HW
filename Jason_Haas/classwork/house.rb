class House
	@@largest = nil

	attr_accessor :name, :color, :year, :sqft

	def initialize(name='jason', color='blue', year=1979, sqft=3000)
		# @@name = 'haas haus'
		# @@color = 'blue'
		# @@year = 2000
		# @@sqft = 4534
		@name = name
		@color = color
		@year = year
		@sqft = sqft
		check_for_largest
	end

	def hello_house
		puts "Hello from #{@name}"
	end

	def to_s
		puts "#{@name} is #{@color}, built in #{@year} and is #{@sqft}"
	end

	def self.largest
		puts "Hello from classs method"
		@@largest.name
	end

	private

	def check_for_largest
		if @@largest.nil? || @sqft > @@largest.sqft
			@@largest = self
		end
	end

end
