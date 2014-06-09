require 'eventbrite-client'

require_relative 'lib/display'
require_relative 'lib/get_input'
require_relative 'lib/load'
require_relative 'lib/print'

token = 'P4W3IXZTY5LIWBHGI6IL' # Token needed to access the API for Eventbrite

puts "Welcome to the Party Crasher App!"
puts "This app lets you view which events are going on based on your inputs."

party = Display.new
party.start
data = Load.new(token)

