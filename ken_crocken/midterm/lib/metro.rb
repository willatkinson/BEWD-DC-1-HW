require_relative 'metro_line'

class Metro
  attr_accessor :response_metro_lines, :metro_incidents, :line_color, :check
  

  def initialize
    @response_metro_lines = JSON.parse(RestClient.get "http://api.wmata.com/Rail.svc/json/JLines?api_key=n2z9aq3redes6k7jekjfzk8q")
    @metro_incidents = JSON.parse(RestClient.get "http://api.wmata.com/Incidents.svc/json/Incidents?api_key=n2z9aq3redes6k7jekjfzk8q")
    @line_color = line_color
    @check = []
  end

  def get_metro_incidents
    if !@metro_incidents['Incidents'].empty?
      puts
      puts "*** Alert! Alert! ***"
      @metro_incidents['Incidents'].each do |incident|
        puts
        puts "#{incident['Description']}"
      end
    else
      puts "No incidents to report."
      puts
    end
  end

  def get_metro_lines
    get_metro_incidents
    x = 0
    puts
    puts "Here are the train lines:"
    @response_metro_lines['Lines'].each do |metro_line|
      x += 1
      @check << x
      puts "#{x} : #{metro_line['DisplayName']}"
    end
    puts
    puts "Please enter the number of the line you need."
    @line_color = gets.chomp.to_i
    check(@line_color)
  end

  def check(line_color)
    if !@check.include?(line_color)
      puts "Sorry, I don't understand."
      get_metro_lines
    else
      get_metro_line(line_color)
    end
  end

  def get_metro_line(line_color)
    if line_color == 1
      line = "RD"
      puts "Red Line Stations:"
    elsif line_color == 2
      line = "OR"
      puts "Orange Line Stations:"
    elsif line_color == 3
      line = "GR"
      puts "Green Line Stations:"
    elsif line_color == 4
      line = "YL"
      puts "Yellow Line Stations:"
    else
      line = "BL"
      puts "Blue Line Stations:"
    end
    color = MetroLine.new(line)

    puts color.get_metro_stations(line)
  end

end
