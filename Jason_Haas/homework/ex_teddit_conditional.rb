# Teddit Contionals - Starter Code.

# Let's add a new Teddit feature. Upvotes!
# Complete the application below. 
# Where you see comments (lines that begin with #) replace it with code so that the program works.

upvotes = 4

def get_input
  gets.chomp
end

def calculate_upvotes(story, category, upvotes)
	# Write code so that:
		# If the Story is about cats multiply the upvotes by 5
		# If the Story is about bacon multiply the upvotes by 8
		# If the Story is about Food it gets 3 times the upvotes.
	if category == 'cats'
		upvotes *= 5
	elsif category == 'bacon'
	 	upvotes *= 8
	elsif category == 'food'
		upvotes *= 3
	else
		abort ("You did not enter a valid category!! Aborting...")
end
	upvotes
end


puts "Welcome to Teddit! a text based news aggregator. Get today's news tomorrow!"
puts "Please enter a News story:"
story = get_input
puts "Please give it a category (cats, bacon, food):"
category = get_input
category.downcase!
upvotes = calculate_upvotes(story, category, upvotes)
puts "New story added! #{story}, Category: #{category.capitalize}, Current Upvotes: #{upvotes}"
