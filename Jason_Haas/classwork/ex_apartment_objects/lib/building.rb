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
		@apartments.each do |apt|
			puts apt
			if apt.is_rented?
				puts apt.renter
			else
				puts 'The apartment is vacant'
			end
		end
	end

	def to_s
		"Building #{building_name} at #{building_address} has #{apartments.count} apartments."
	end
end