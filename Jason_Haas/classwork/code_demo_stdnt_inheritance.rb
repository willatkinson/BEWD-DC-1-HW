
#Sharing Behavior and Variables
#TIME: 20 min

# Create an employee class.
class Employee
	attr_accessor :first_name, :last_name, :employee_id

	def initialize(first_name, last_name, employee_id)
		@first_name, @last_name, @employee_id = first_name, last_name, employee_id
	end

	def identify_employee
		"#{self.employee_id}: #{@first_name} #{last_name}"
	end
end

# A manager is contactable by email,
# and wants their title as part of their name display
class Manager < Employee
	attr_accessor :email, :title
	def initialize(email, title, first_name, last_name, employee_id)
		super(first_name, last_name, employee_id)
		@email, @title = email, title
	end

	def identify_employee
		"#{self.employee_id}: #{@first_name} #{last_name}"
end

# A marketer can be contacted via twitter
# but is fine with the default name display
class Marketer < Employee


end

corey = Manager.new('cdawg@hotmail.com', 'Professor', 'Corey', 'Speisman', 1)

# corey = Employee.new('Corey', 'Speisman', 1)
# p corey.first_name == 'Corey'
# p corey.identify_employee == '1: Corey Speisman'


# BONUS: Demonstrate how to make this code less error-prone by using named arguments
#        for the initializers
