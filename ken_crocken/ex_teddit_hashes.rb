# Step 1: Working with Arrays and Hashes

# Copy your solution from conditional_teddit.rb. 
# Create an empty stories array. This will be used to hold all stories we capture.
# Users enter the story as they do now, but it gets put in a hash instead. 
# Update any reference to the story (upvotes, category and title) 
# Your story hash should look like the one below: 
# { title: "Monkeys thank mayor for flounder tooth necklace", category: "Teeth", upvotes: 1 }
# Add the hash to an array called stories and print "Story: Monkeys thank mayor for flounder tooth necklace, Category: (Teeth), Current Upvotes: 1"
# Using the stories array 
# Test your cat, bacon, and food upvote conditional logic.
#
# Step 2: Adding Loops 
# Use a loop, so that your program continues to ask a user for stories until they chose to quit. ("Would you like to add another story? Enter 'y' or 'n'")
# Once the user is finished with entering their stories, use .each to print each story in the stories array. 

# --- Method to obtain input
def get_input
  gets.strip #gets.strip removes special characters v. gets.chomp removes last character
end

# --- Method to calculate upvotes 
def calculate_upvotes(stories_hash)

    stories_hash[:upvotes] = 1

    if stories_hash[:title].downcase.include? "cat"
      stories_hash[:upvotes] *= 5

    elsif stories_hash[:title].downcase.include? "bacon"
      stories_hash[:upvotes] *= 8
    end

    if stories_hash[:category].downcase.include? "food"
      stories_hash[:upvotes] *= 3
    end

      stories_hash[:upvotes]

end

def show_all_stories(stories)

  stories.each do |exit_stories|
    puts "Story: #{exit_stories[:title]}, Category: (#{exit_stories[:category]}), Current Upvotes: #{exit_stories[:upvotes]}" 
  end
end

puts "Welcome to Teddit! a text based news aggregator. Get today's news tomorrow!"

stories = [] # Create an empty stories array. This will be used to hold all stories we capture.

# --- Begin loop
answer = "y" # conditional variable for loop
while answer == "y"

  # --- initialize hash
  stories_hash = {}

  puts # create an extra line for readability

  # --- Gather user input
  puts "Please enter a News story:"
  stories_hash[:title] = get_input
  puts "Please give it a category:"
  stories_hash[:category] = get_input
  stories_hash[:upvotes] = calculate_upvotes(stories_hash)

  # --- Print hash
  puts "Story: #{stories_hash[:title]}, Category: (#{stories_hash[:category]}), Current Upvotes: #{stories_hash[:upvotes]}" 
  
  # --- Stash hash in stories array
  stories << stories_hash
  
  # --- Ask if user would like to enter another story
  puts "Would you like to add another story? Enter 'y' or 'n'"
  answer = get_input.downcase

  if answer != "y" && answer != "n"
    puts "Please enter a valid answer ('y' or 'n')."
    answer = get_input.downcase
  end

end

puts "Your stories:"
show_all_stories(stories)
puts
puts "Come again real soon!"




