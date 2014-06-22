#Explaining classes, objects, attr_accessor & load paths. 

class Apartment
	attr_accessor :name, :rent, :sqft, :num_bedrooms, :num_bathrooms, :renters

	def initialize (name, rent, sqft, num_bedrooms, num_bathrooms)
		@name, @rent, @sqft, @num_bedrooms, @num_bathrooms = name, rent, sqft, num_bedrooms, num_bathrooms
		@renters = []
	end

	def is_occupied?
		@renters.any?
	end

	def self.to_s
		"#{@name} is #{@sqft} square feet and is currently occupied by #{@renters.count} residents"
	end
end


alex_apt = Apartment.new "Alex's Apartment", 2300, 3000, 1, 1
alex_apt.renters = ['alex', 'cat']

if alex_apt.is_occupied?
	puts "This apartment is not for rent"
else
	puts alex_apt
	puts 'This apartment is available!'
end
