require 'json'
require 'rest_client'
require_relative 'lib/metro'

puts `clear`
puts "Welcome to ... "
puts '   _____          __                _________                                           .___
  /     \   _____/  |________  ____ \_   ___ \  ____   _____   _____ _____    ____    __| _/
 /  \ /  \_/ __ \   __\_  __ \/  _ \/    \  \/ /  _ \ /     \ /     \\\__  \  /    \  / __ | 
/    Y    \  ___/|  |  |  | \(  <_> )     \___(  <_> )  Y Y  \  Y Y  \/ __ \|   |  \/ /_/ | 
\____|__  /\___  >__|  |__|   \____/ \______  /\____/|__|_|  /__|_|  (____  /___|  /\____ | 
        \/     \/                           \/             \/      \/     \/     \/      \/ '
puts "Take command of your trip on DC's metro rails ..."
metro = Metro.new
metro.get_metro_lines

