#Person Class.
class Person
	attr_accessor :name, :credit_score, :gender
	def intialize(name, credit_score, gender)
		@name = name
		@credit_score = credit_score
		@gender = gender
	end
end
