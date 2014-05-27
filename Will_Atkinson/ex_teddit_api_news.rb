# We're going to add a remote data source to pull in stories from Mashable, Digg, and reddit.
  # http://mashable.com/stories.json
  # http://digg.com/api/news/popular.json
  # http://www.reddit.com/.json
# These stories will also be upvoted based on our rules. No more user input!

# Pull the json, parse it and then make a new story hash out of each story(Title, Category, Upvotes)
# Add each story to an array and display your "Front page"

require 'rest_client'
require 'json'
 
def display_message(message)
  puts message
end

def calculate_upvotes(story, category)
  upvotes = 1
 
    upvotes *= 5 if story.downcase.include?('cat')
    upvotes *= 8 if story.downcase.include?('bacon')
    upvotes *= 3 if category.downcase.include?('food')
    
  upvotes
end
 
def print_story(story, category, upvotes)
  if upvotes > 1 
    display_message("\n#{story}, \nCATEGORY: #{category.capitalize}, UPVOTES: #{upvotes}")
  end
end
 
def story_entry(title, category, upvotes)
  {
    title: title,
    category: category,
    upvotes: upvotes
  }
end

def get_mashable_stories
  mashable_stories =[]
  mashable_response  =  JSON.parse(RestClient.get 'http://mashable.com/stories.json') #get + load Mashable data
  mashable_response['hot'].each do |mashable_story|
    upvotes = calculate_upvotes(mashable_story['title'], mashable_story['channel'])
    story = story_entry(mashable_story['title'], mashable_story['channel'], upvotes)
    mashable_stories << story
  end
  mashable_stories
end
 
def get_reddit_stories 
  reddit_stories = [] # initializes array of Reddit stories
  reddit_response = JSON.parse(RestClient.get 'http://reddit.com/.json') # getting & loading Reddit data

  reddit_response['data']['children'].each do |reddit_post| # iterate Reddit data nested under data/children
    upvotes = calculate_upvotes(reddit_post['data']['title'], reddit_post['data']['subreddit'])
    story = story_entry(reddit_post['data']['title'], reddit_post['data']['subreddit'], upvotes) 
    reddit_stories << story
  end
  reddit_stories 
end

def get_digg_stories 
  digg_stories = []
  digg_response  =  JSON.parse(RestClient.get 'http://digg.com/api/news/popular.json') # getting & loading Digg data
  
  digg_response['data']['feed'].each do |digg_post|
    upvotes = calculate_upvotes(digg_post['content']['title'], digg_post['content']['tags'][0]['name'])
    story = story_entry(digg_post['content']['title'], digg_post['content']['tags'][0]['name'], upvotes)
    digg_stories << story
  end
  digg_stories
end
 
def print_stories(stories)
  stories.each do |story|
    print_story(story[:title], story[:category], story[:upvotes])
  end
end
  
display_message("Welcome to Teddit! A text-based news aggregator. Get today's news tomorrow!")

puts ''
puts '***** REDDIT STORIES *****'
print_stories(get_reddit_stories)
puts ''
puts '***** DIGG STORIES *****'
print_stories(get_digg_stories)
puts ''
puts '***** MASHABLE STORIES *****'
print_stories(get_mashable_stories)