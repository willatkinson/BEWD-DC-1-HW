#Building Class
class Building
	attr_accessor :building_name, :building_address, :apartments

	def initialize (building_name, building_address)
		@building_name = building_name
		@building_address = building_address
		@apartments = []
	end

	def view_apartments
		puts "----------------#{@building_name} Apartment list------------------"
		puts @apartments
		# @apartments.each do |apt|
		# 	puts "Apartment: #{@apartments.name[apt]}"
		# 	puts "sqft: #{@apartments.apt_sqft[apt]}	Bedrooms:  #{@apartments.apt_bedrooms[apt]}		Bathrooms:  #{@apartments.apt_bathrooms[apt]}"
		# 	if @apartments.empty?
		# 		puts "The apartments is vacant"
		# 	else
		# 		puts "#{@apartments.renter[apt]}"
		# 	end
		# end
	end
end