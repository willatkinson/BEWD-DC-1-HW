class Url < ActiveRecord::Base
	before_save :create_hash
	def create_hash
		self.hash_code = rand(1..100000)
	end

end
