1.upto(100) do |n|

	if n%3 == 0 && n%5 == 0
		puts "FIZZBUZZ"
	elsif n%3 == 0
		puts "FIZZ"
	elsif n%5 == 0
		puts "BUZZ" 
	else 
		puts n
	end
end