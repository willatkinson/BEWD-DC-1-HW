require 'json'
require 'rest_client'
require_relative 'lib/metro'

# def transport_mode
#   puts "How do you want to get around?"

#   puts "1 : Train" 
#   puts "2 : Bus" 
#   puts "3 : Bike" 
#   puts "4 : Car \n"
#   puts "Enter the number for the appropriate transportation mode."
#   mode = gets.chomp.to_i
#   mode_check(mode)
# end

# def mode_check(mode)
#   mode_check = (1..4).to_a
#   if !mode_check.include?(mode)
#     puts "Sorry, I don't understand."
#     transport_mode
#   else
#     if mode == 1
#       metro = Metro.new
#       puts metro.get_metro_lines
#     else
#       puts "That functionality is coming soon!  Please choose another mode of transport. (Hint: Trains)"
#       transport_mode
#     end
#   end
# end

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

