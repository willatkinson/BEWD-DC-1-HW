class SecretNumber
# this class will generate our secret number for us
  attr_accessor :number

  def initialize 
    @number = [1,2,3,4,5,6,7,8,9,10]
    @number = @number.sample
  end

end
