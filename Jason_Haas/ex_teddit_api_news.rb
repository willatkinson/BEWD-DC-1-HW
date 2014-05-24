# We're going to add a remote data source to pull in stories from Mashable, Digg, and reddit.
  # http://mashable.com/stories.json
  # http://digg.com/api/news/popular.json
  # http://www.reddit.com/.json
# These stories will also be upvoted based on our rules. No more user input!

# Pull the json, parse it and then make a new story hash out of each story(Title, Category, Upvotes)
# Add each story to an array and display your "Front page"
require 'rest_client'
require 'json'



def get_mashable_stories
	mashable = JSON.parse(RestClient.get 'http://mashable.com/stories.json')
	mashable_hash = {}
	mashable_array = []
	mashable['new'].each do |story|
		title = story['title']
		category = story['channel']
		upvotes = calculate_upvotes(title, category)
		mashable_hash = {title: title, category: category, upvotes: upvotes}
		mashable_array << mashable_hash
	end
	mashable_array
end

def get_digg_stories
	digg = JSON.parse(RestClient.get 'http://digg.com/api/news/popular.json')
	digg_hash = {}
	digg_array = []
	digg['data']['feed'].each do |story|
	    title = story['content']['title']
	    category = story['content']['tags'][0]['display']
	    upvotes = calculate_upvotes(title, category)
	    digg_hash = {title: title, category: category, upvotes: upvotes}
	    digg_array << digg_hash
	end
	digg_array
end

def get_reddit_stories
	reddit = JSON.parse(RestClient.get 'http://www.reddit.com/.json')
	reddit_hash = {}
	reddit_array = []
	reddit['data']['children'].each do |story|
	    title = story['data']['title']
	    category = story['data']['subreddit']
	    upvotes = calculate_upvotes(title, category)
	    reddit_hash = {title: title, category: category, upvotes: upvotes}
	    reddit_array << reddit_hash
	end
	reddit_array
end

def calculate_upvotes(title, category)
	upvotes = 1
	if title.downcase.include? 'cat' then upvotes *= 5
	elsif title.downcase.include? 'bacon' then upvotes *= 8
	elsif title.downcase.include? 'food' then upvotes *= 3
	elsif title.downcase.include? 'lions' then upvotes *= 7
	end
	upvotes
end

def print_mashable
	puts "Mashable front page"
	puts "--------------------"
	get_mashable_stories.each do |story|
		puts "Title: #{story[:title]} | Category: #{story[:category]} | Upvotes: #{story[:upvotes]}"
	end
end

def print_digg
	puts "Digg front page"
	puts "---------------"
	get_digg_stories.each do |story|
		puts "Title: #{story[:title]} | Category: #{story[:category]} | Upvotes: #{story[:upvotes]}"
	end
end

def print_reddit
	puts "Reddit front page"
	puts "------------------"
	get_reddit_stories.each do |story|
		puts "Title: #{story[:title]} | Category: #{story[:category]} | Upvotes: #{story[:upvotes]}"
	end
end

# puts calculate_upvotes('i saw a broken', 'cool')

print_mashable
print_digg
print_reddit


