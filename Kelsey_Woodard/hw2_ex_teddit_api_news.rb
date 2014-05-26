# We're going to add a remote data source to pull in stories from Mashable, Digg, and reddit.
  # http://mashable.com/stories.json
  # http://digg.com/api/news/popular.json
  # http://www.reddit.com/.json
# These stories will also be upvoted based on our rules. No more user input!

# Pull the json, parse it and then make a new story hash out of each story(Title, Category, Upvotes)
# Add each story to an array and display your "Front page"

require 'rest_client'
require 'json'

def get_mashable_stories # Pulls the json and parses story
	response = JSON.parse(RestClient.get 'http://mashable.com/stories.json')
	news_array = Array.new
	response['new'].each do |story|
		title = story['title']
		category = story['channel']
		upvotes = calculate_upvotes(title, category) # Calls calculate_upvotes method
		hash = { :title => "#{title}", :category => "#{category}", :upvotes => "#{upvotes}" }
		news_array << hash # Inserts hashes into the array
	end
	front_page(news_array)
end


def front_page(news_array) # Displays front page
	puts "Welcome to Teddit! a text based news aggregator. Get today's news tomorrow!"
	puts ""
	news_array.each do |story| 
		puts "New story added! #{story[:title]}"
		puts "Category: #{story[:category]}"
		puts "Current Upvotes: #{story [:upvotes]}"
		puts ""
	end
end


def calculate_upvotes(title, category) # Calculates upvotes
	upvotes = 1
	if category.include?('Lifestyle') || title.include?('Lifestyle')
		upvotes *= 5 
	end

	if category.include?('Tech') || title.include?('Tech')
		upvotes *= 8 
	end

	if category.include?('Entertainment') || title.include?('Entertainment')
		upvotes *= 3 
	end

	upvotes
end


get_mashable_stories
front_page(get_mashable_stories)

