#Building Class
class Building
	attr_accessor :building_name, :building_address, :apartments #allows to access method as object
	def initialize(building_name, building_address)
		@building_name = building_name
		@building_address = building_address
		@apartments = []
	end
	def view_apartments
		@apartments.each do |apartments|
			"#{apartment.name} is #{apartment.apt_sqft} and rends for #{apartment.rent}"
		end
	end

end
