# We're going to add a remote data source to pull in stories from Mashable and Digg.
#   http://mashable.com/stories.json
#   http://digg.com/api/news/popular.json
# These stories will also be upvoted based on our rules. No more user input!

# Pull the json, parse it and then make a new story hash out of each story(Title, Category, Upvotes)
# Add each story to an array and display your "Front page"

puts "Welcome to Teddit! a text based news aggregator. Loading your Front page ..."

require "json"
require "rest_client"

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
  story
end

def show_all_stories(stories)
  stories.each do |story|
    show_message "Story: #{story[:title]}, Category: #{story[:category]}, Current Upvotes: #{story[:upvotes]}"
  end
end


def get_mashable_stories
  response = JSON.parse(RestClient.get "http://mashable.com/stories.json")
  response["new"].each do |story|
  title = story["title"]
  category = story["channel"]
  story_hash = {title: title, category: category}
  p calculate_upvotes(story_hash)
  end
end

def get_digg_stories
  response = JSON.parse(RestClient.get "http://digg.com/api/news/popular.json")
  response["data"]["feed"].each do |story|
  title = story["content"]["title"]
  category = story["content"]["tags"][0]['slug']
  story_hash = {title: title, category: category}
  p calculate_upvotes(story_hash)
  end
end

get_mashable_stories
get_digg_stories