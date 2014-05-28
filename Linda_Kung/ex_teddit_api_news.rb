# We're going to add a remote data source to pull in stories from Mashable, Digg, and reddit.
  # http://mashable.com/stories.json
  # http://digg.com/api/news/popular.json
  # http://www.reddit.com/.json
# These stories will also be upvoted based on our rules. No more user input!

# Pull the json, parse it and then make a new story hash out of each story(Title, Category, Upvotes)
# Add each story to an array and display your "Front page"

require 'rest_client'
require 'json'

digg = JSON.parse(RestClient.get 'http://digg.com/api/news/popular.json')
mashable = JSON.parse(RestClient.get 'http://mashable.com/stories.json')
reddit = JSON.parse(RestClient.get 'http://www.reddit.com/.json')

digg_story =[]

digg['data']['feed'].each do |story|
	digg_story << {title: story['content']['title_alt'], 
		category: story['content']['tags'][0]['display'], 
		upvotes: story['diggs']['count']}
end

mash_story = []

mashable['new'].each do |story|
	mash_story << {title: story['title'], 
		category: story['channel'], 
		upvotes: story['shares']['total']}
end

reddit_story = []

reddit['data']['children'].each do |story|
	reddit_story << {title: story['data']['title'],
		category: story['data']['subreddit'],
		upvotes: story['data']['ups']}
end


p "--------- FRONT PAGE: From Digg --------- "
digg_story.each do |story|
	puts " "
	p "Title: #{story[:title]}"
	p "Category: #{story[:category]}"
	p "Upvotes: #{story[:upvotes]}"
	puts " "
end

p "--------- FRONT PAGE: From Mashable --------- "
mash_story.each do |story|
	puts " "
	p "Title: #{story[:title]}"
	p "Category: #{story[:category]}"
	p "Upvotes: #{story[:upvotes]}"
	puts " "
end

p "--------- FRONT PAGE: From Reddit --------- "
reddit_story.each do |story|
	puts " "
	p "Title: #{story[:title]}"
	p "Category: #{story[:category]}"
	p "Upvotes: #{story[:upvotes]}"
	puts " "

end



