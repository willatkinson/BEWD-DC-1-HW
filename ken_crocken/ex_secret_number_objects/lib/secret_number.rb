class SecretNumber
# this class will generate our secret number for us
  attr_accessor :number

  def initialize 
    @number = (1..10).to_a
    @number = @number.sample
  end

end
