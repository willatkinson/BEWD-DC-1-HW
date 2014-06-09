require 'eventbrite-client'

class Load
	attr_accessor :token

	def initialize(token)
		eb_client = EventbriteClient.new({ access_token: token})
		case @selection
		when 1
			@response = eb_client.event_search('category=cats')
		when 2
			@response = eb_client.event_search('city=cats')
		when 3
			@response = eb_client.event_search('region=cats')
		when 4
			@response = eb_client.event_search('postal_code=cats')
		when 5
			@response = eb_client.event_search('date=cats')
		else
			puts "Something went wrong."
	end