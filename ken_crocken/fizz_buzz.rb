def fizzbuzz(num)
  num % 3 * num % 5 == 0 ? (num % 3 == 0 ? "fizz" : "") + (num % 5 == 0 ? "buzz" : "") : num
  #num % 3 == 0 && num % 5 == 0 ? "fizzbuzz" : num % 3 == 0 ? "fizz" : num % 5 == 0 ? "buzz" : num
end

1.upto(100) do |num|
  puts fizzbuzz(num)
end

def assert(truthy)
  raise "There was an error" if !truthy
end
 
assert fizzbuzz(1) == 1
assert fizzbuzz(2) == 2
assert fizzbuzz(3) == 'fizz'
assert fizzbuzz(4) == 4
assert fizzbuzz(5) == 'buzz'
assert fizzbuzz(9) == 'fizz'
assert fizzbuzz(15) == 'fizzbuzz'