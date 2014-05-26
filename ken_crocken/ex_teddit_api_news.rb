# We're going to add a remote data source to pull in stories from Mashable, Digg, and reddit.
  # http://mashable.com/stories.json
  # http://digg.com/api/news/popular.json
  # http://www.reddit.com/.json
# These stories will also be upvoted based on our rules. No more user input!

# Pull the json, parse it and then make a new story hash out of each story(Title, Category, Upvotes)
# Add each story to an array and display your "Front page"
require 'json'
require 'rest_client'

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

end

def show_all_stories(stories)
  1.upto(5) do |s|
    #stories.each do |exit_stories|
      puts "Story: #{stories[-s][:title]}" 
      puts "Category: (#{stories[-s][:category]})" 
      puts "Current Upvotes: #{stories[-s][:upvotes]}" 
      puts
    #end
  end
end

puts "Welcome to Teddit! a text based news aggregator. Get today's news tomorrow!"
# --- initialize hash

$digg = []
def get_digg_stories 
  response_digg  =  JSON.parse(RestClient.get 'http://digg.com/api/news/popular.json')
  response_digg['data']['feed'].each do |digg_story|
    stories_hash = { title: digg_story['content']['title'], category: digg_story['content']['tags'][0]['name'] }
    calculate_upvotes(stories_hash)
    $digg << stories_hash
  end
end

$mashable =[]
def get_mashable_stories
  response_mashable  =  JSON.parse(RestClient.get 'http://mashable.com/stories.json')
  response_mashable['hot'].each do |mashable_story|
    stories_hash = { title: mashable_story['title'], category: mashable_story['channel'] }
    calculate_upvotes(stories_hash)
    $mashable << stories_hash
  end
end

$reddit =[]
def get_reddit_stories
  response_reddit  =  JSON.parse(RestClient.get 'http://www.reddit.com/.json')
  response_reddit['data']['children'].each do |reddit_story|
    stories_hash = { title: reddit_story['data']['title'], category: reddit_story['data']['subreddit'] }
    calculate_upvotes(stories_hash)
    $reddit << stories_hash
  end
end

get_digg_stories 
get_mashable_stories
get_reddit_stories
puts "=========================== Digg stories:"
show_all_stories($digg)
puts
puts "=========================== Mashable stories:"
show_all_stories($mashable)
puts
puts "=========================== Reddit Stories:"
show_all_stories($reddit)