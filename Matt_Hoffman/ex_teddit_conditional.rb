# Teddit Contionals - Starter Code.

# Let's add a new Teddit feature. Upvotes!
# Complete the application below. 
# Where you see comments (lines that begin with #) replace it with code so that the program works.

def get_input
  gets
end

def calculate_upvotes(story, category, tempupvotes)
	if category=='cats'
	return 5*tempupvotes
	elsif category=='bacon'
	return 8*tempupvotes
	elsif category=='food'
	return 3*tempupvotes
	else
	return tempupvotes
end
end


puts "Welcome to Teddit! a text based news aggregator. Get today's news tomorrow!"
puts "Please enter a News story:"
story = get_input.chomp
puts "Please give it a category:"
category = get_input.chomp.downcase
puts "Please give the current number of upvotes:"
tempupvotes = get_input.chomp.to_i
upvotes = calculate_upvotes(story, category, tempupvotes)
puts "New story added! #{story}, Category: #{category.capitalize}, Current Upvotes: #{upvotes}"