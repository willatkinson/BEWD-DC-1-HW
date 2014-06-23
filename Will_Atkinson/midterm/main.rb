$:.unshift (File.dirname(__FILE__))
require 'lib/parser'
puts ''
puts '   / ____/ / / / | / / ____/  |/  / __ \/ /   / __ \ \/ /  |/  / ____/ | / /_  __/
  / /_  / / / /  |/ / __/ / /|_/ / /_/ / /   / / / /\  / /|_/ / __/ /  |/ / / /   
 / __/ / /_/ / /|  / /___/ /  / / ____/ /___/ /_/ / / / /  / / /___/ /|  / / /    
/_/    \____/_/ |_/_____/_/  /_/_/   /_____/\____/ /_/_/  /_/_____/_/ |_/ /_/     
                                                                                  '
# THIS IS SO FREAKING COOL!!!
 
puts 'Funemployment will tell you the unemployment rate for any month starting in 1948.'
parser = Parser.new
parser.get_data