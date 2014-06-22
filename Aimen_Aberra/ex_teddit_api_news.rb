# We're going to add a remote data source to pull in stories from Mashable, Digg, and reddit.
  # http://mashable.com/stories.json
  # http://digg.com/api/news/popular.json
  # http://www.reddit.com/.json
# These stories will also be upvoted based on our rules. No more user input!

# Pull the json, parse it and then make a new story hash out of each story(Title, Category, Upvotes)
# Add each story to an array and display your "Front page"

require 'rest_client'
require 'json'

def show_message(message)
  puts message
end

# def get_input
#   gets.strip
# end

def get_digg

response = JSON.parse(RestClient.get 'http://digg.com/api/news/popular.json')
# puts response['data']['feed'][0]['content']['title']

stories = []

response['data']['feed'].each do |story|
	story_hash = {}
	story_hash[:title] = story['content']['title']
	story_hash[:category] = story['content']['tags'][0]['display']
	calculate_upvotes(story_hash)
	stories.push(story_hash)
	end
	show_all_stories(stories)
end

def get_mashable

response = JSON.parse(RestClient.get 'http://mashable.com/stories.json')

stories = []

	response['new'].each do |story|
	 	story_hash = {}
		story_hash[:title] = story['title']
	 	story_hash[:category] = story['channel']
	 	calculate_upvotes(story_hash)
	 	stories.push(story_hash)
	end
	show_all_stories(stories)
end

def get_reddit
response = JSON.parse(RestClient.get 'http://www.reddit.com/.json')

stories = []

	response['data']['children'].each do |story|
		story_hash = {}
		story_hash[:title] = story['data']['title']
		story_hash[:category] = story['data']['subreddit']
		calculate_upvotes(story_hash)
	  	stories.push(story_hash)
	end
	show_all_stories(stories)
end


# def show_new_story_notification(story)
#   show_message("New story added! #{story[:title]}, Category: #{story[:category].capitalize}, Current Upvotes: #{story[:upvotes]}")
# end

def calculate_upvotes(story)
  story[:upvotes] = 1

  if story[:title].downcase.include? 'cat'
    story[:upvotes] *= 5
  elsif story[:title].downcase.include? 'bacon'
    story[:upvotes] *= 8
  end

  if story[:category].downcase == "food"
    story[:upvotes] *= 3
  end
end

def show_all_stories(stories)
  stories.each do |story|
    show_message "Story: #{story[:title]}, Category: #{story[:category]}, Current Upvotes: #{story[:upvotes]}"
  end
end

# stories = []

show_message("Welcome to Teddit! a text based news aggregator. Get today's news tomorrow!")
get_digg
get_reddit
get_mashable

# answer = "y"

# while answer == "y"
#   story = {}

#   show_message("Please enter a News story:")
#   story[:title] = get_input

#   show_message("Please give it a category:")
#   story[:category] = get_input

#   calculate_upvotes(story)

#   stories << story
#   show_new_story_notification(story)

#   show_message("Would you like to add another story? Enter 'y' or 'n'")
#   answer = get_input.strip.downcase
# end

# show_all_stories stories
