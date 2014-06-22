class SecretNumber
  attr_accessor :arr, :number
  	def initialize
  		@arr = []
  		@number = nil
  	end

  	def fill_arr
  		1.upto(10) do |x|
  			@arr.push(x)
  		end
      @number = self.arr.sample
      self
  	end
end