# Teddit Contionals - Starter Code.

# Let's add a new Teddit feature. Upvotes!
# Complete the application below. 
# Where you see comments (lines that begin with #) replace it with code so that the program works.

def get_input
  story = gets.chomp
end

def calculate_upvotes(story, category)
		upvotes = 1
	# Write code so that:
		# If the Story is about cats multiply the upvotes by 5
		# If the Story is about bacon multiply the upvotes by 8
		# If the Story is about Food it gets 3 times the upvotes.
		# elsif category == "bacon"
		# 	upvotes*8
		# else category == "food"
		# 	upvotes*3
		# end

		upvotes *= 5 if cat_upvote?(category)
		upvotes *= 8 if bacon_upvote?(category)
		upvotes *= 3 if food_upvote?(category)

		upvotes
	#For example:
	# "Cats frolic despite tuna shortage" should give you 5 times the upvotes!
end


def cat_upvote?(topic)
	topic == "cats"
end

# p cat_upvote?('cats')
# p cat_upvote?('dogs')

def bacon_upvote?(topic)
	topic == "bacon"
end

# p bacon_upvote?('bruno mars')
# p bacon_upvote?('bacon')

def food_upvote?(topic)
	topic == "food"
end
# puts calculate_upvotes('some story', 'cats') == 5
# puts calculate_upvotes('some story', 'bacon') == 8
# puts calculate_upvotes('some story', 'food') == 3


# p food_upvote?('food')
# p food_upvote?('trash')


puts "Welcome to Teddit! a text based news aggregator. Get today's news tomorrow!"
puts "Please enter a News story:"
story = get_input
puts "Please give it a category:"
category = get_input
upvotes = calculate_upvotes(story, category)
puts "New story added! #{story}, Category: #{category.capitalize}, Current Upvotes: #{upvotes}"