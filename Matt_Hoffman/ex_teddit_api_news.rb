# We're going to add a remote data source to pull in stories from Mashable, Digg, and reddit.
  # http://mashable.com/stories.json
  # http://digg.com/api/news/popular.json
  # http://www.reddit.com/.json
# These stories will also be upvoted based on our rules. No more user input!

# Pull the json, parse it and then make a new story hash out of each story(Title, Category, Upvotes)
# Add each story to an array and display your "Front page"

require 'json'
require 'rest_client'
mash = JSON.parse(RestClient.get 'http://mashable.com/stories.json')
digg = JSON.parse(RestClient.get 'http://digg.com/api/news/popular.json')
reddit = JSON.parse(RestClient.get 'http://www.reddit.com/.json')

mash_arr = []

mashcats = ['hot','rising','new']

mashcats.each do |x|
	mash[x].each do |y|
	mash_arr << {title: y['title'], category: y['channel'], upvotes: y['shares']['total']}
end
end

digg_arr = []

digg['data']['feed'].each do |x|
	digg_arr << {title: x['content']['title_alt'], category: x['content']['tags'][0]['display'], upvotes: x['tweets']['count']}
end

reddit_arr = []

reddit['data']['children'].each do |x|
	reddit_arr << {title: x['data']['title'], category: x['data']['subreddit'].capitalize, upvotes: x['data']['ups']}
end

reddit_arr.each do |x|
	x['upvotes'] *= 5 if x[:category].include?('cat')
end

puts 'See latest top stories'
puts ''
puts 'From Digg:'
5.downto(1) do |x|
	puts "Title:  #{digg_arr[-x][:title]}"
	puts "Category:  #{digg_arr[-x][:category]}"
	puts "Upvotes:  #{digg_arr[-x][:upvotes]}"
	puts ""
end
puts 'From Reddit'
5.downto(1) do |x|
	puts "Title:  #{reddit_arr[-x][:title]}"
	puts "Category:  #{reddit_arr[-x][:category]}"
	puts "Upvotes:  #{reddit_arr[-x][:upvotes]}"
	puts ""
end
puts 'From Mashable'
5.downto(1) do |x|
	puts "Title:  #{mash_arr[-x][:title]}"
	puts "Category:  #{mash_arr[-x][:category]}"
	puts "Upvotes:  #{mash_arr[-x][:upvotes]}"
	puts ""
end


# mash['hot'].each do |x|
# 	mash_arr << {title: x['title'], category: x['channel'], upvotes: x['shares']['total']}
# end

# mash['rising'].each do |x|
# 	mash_arr << {title: x['title'], category: x['channel'], upvotes: x['shares']['total']}
# end

# mash['new'].each do |x|
# 	mash_arr << {title: x['title'], category: x['channel'], upvotes: x['shares']['total']}
# end

# puts mash_arr