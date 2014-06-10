require_relative 'station'

class MetroLine

  attr_accessor :line, :response_metro_stations, :metro_stations, :check
  

  def initialize(color)
    @line = color
    @response_metro_stations = response_metro_stations
    @metro_stations = []
    @check = []
  end

  def get_metro_stations(line)
    url = "http://api.wmata.com/Rail.svc/json/JStations?LineCode=#{line}&api_key=n2z9aq3redes6k7jekjfzk8q"
    @response_metro_stations = JSON.parse(RestClient.get "#{url}")
    show_stations(@response_metro_stations)
  end
  
  def show_stations(y)
    i = -1
    x = 0
    y['Stations'].each do |metro_station|
      i += 1
      x += 1
      @check << x
      @metro_stations << metro_station
      puts"#{x} : #{@metro_stations[i]['Name']}"
    end
    choose_station
  end

  def choose_station
    puts "What station do you need?"
    num_choice = gets.chomp.to_i
    check(num_choice)
  end

  def check(choice)
    if !@check.include?(choice)
      puts "Sorry, I don't understand."
      get_metro_stations(@line)
    else
      get_station(choice)
    end
  end

  def get_station(num_choice)
    num_choice -= 1
    user_station = @metro_stations[num_choice]['Code']
    station = Station.new(user_station)
    station.get_station
  end

end