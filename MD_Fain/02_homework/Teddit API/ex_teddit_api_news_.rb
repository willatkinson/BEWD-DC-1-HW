# We're going to add a remote data source to pull in stories from Mashable, Digg, and reddit.
  # http://mashable.com/stories.json
  # http://digg.com/api/news/popular.json
  # http://www.reddit.com/.json
# These stories will also be upvoted based on our rules. No more user input!

# Pull the json, parse it and then make a new story hash out of each story(Title, Category, Upvotes)
# Add each story to an array and display your "Front page"

require 'json'
require 'rest_client'


# mashable = JSON.parse(RestClient.get 'http://mashable.com/stories.json')

# reddit = JSON.parse(RestClient.get 'http://www.reddit.com/.json')

def calculate_upvotes(anything, category)

	upvotes = 1
	if anything.downcase.include? 'the'
		upvotes *= 5
	elsif anything.downcase.include? 'technology'
		upvotes *= 8
	end
	if category.downcase == 'computer'
		upvotes *= 3
	end
	p "UPVOTES: #{upvotes}"

	dash = '-'
	5.times {|line| dash += dash}
	puts dash

end

def get_digg_stories
digg = JSON.parse(RestClient.get 'http://digg.com/api/news/popular.json')
digg ['data']['feed'].each do |story|
	title = story['content']['title']
	p "TITLE: #{title}"
	category = story['content']['tags'][0]['display']
	p "CATEGORY = #{category}"
	calculate_upvotes(title, category)
	end
end

def get_mashable_stories
mashable = JSON.parse(RestClient.get 'http://mashable.com/stories.json')
mashable ['new'].each do |story|
	title = story['title']
	p "TITLE: #{title}"
	category = story['channel']
	p "CATEGORY = #{category}"
	calculate_upvotes(title, category)
	end
end

def get_reddit_stories
reddit = reddit = JSON.parse(RestClient.get 'http://www.reddit.com/.json')
reddit ['data']['children'].each do |story|
	title = story['data']['title']
	p "TITLE: #{title}"
	category = story['data']['subreddit']
	p "CATEGORY = #{category}"
	calculate_upvotes(title, category)
	end
end

puts '========== Digg Stories ========='
get_digg_stories
puts '========== Mashable Stories ========='
get_mashable_stories
puts '========== Reddit Stories ========='
get_reddit_stories

