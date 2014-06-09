require 'eventbrite-client'

require_relative 'lib/display'
require_relative 'lib/get_input'
require_relative 'lib/load'
require_relative 'lib/print'


puts "Welcome to the Party Crasher App!"
puts "This app lets you view which events are going on based on your inputs."

Display.new
Display.start
