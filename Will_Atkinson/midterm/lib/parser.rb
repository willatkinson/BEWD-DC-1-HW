# Funemployment v1.0 - Will Atkinson
# This app takes user input and returns unemployment data from 
# the Bureau of Labor Statistics' API.

require 'rest_client'
require 'json'

class Parser

   attr_accessor :month, :year, :unemp_rate
   
   def initialize
      @month = month
      @year = year
      @unemp_rate = "0"
   end

   def menu
      time = Time.new
      months = ["January", "February", "March", "April", "May", "June", "July", 
            "August", "September", "October", "November", "December"]
      puts "What year for the unemployment statistic?"
         @year = gets.chomp.to_i
         until year > 1947 && year <= time.year
            puts 'Year must be between 1948 and present.'
            @year = gets.chomp.to_i
         end
      puts "What month?"
         @month = gets.chomp.to_s
         until months.include? (@month)
            puts 'Invalid month. Please spell full month name.'
            @month = gets.chomp.to_s
         end
   end

   def get_data
      menu
      unemp_numbers = []

      response = RestClient.post('http://api.bls.gov/publicAPI/v1/timeseries/data/',
                           {'seriesid' => ['LNS14000000'],
                              'startyear' =>  year,
                              'endyear' => year
                              }.to_json,
                              :content_type => 'application/json')
      parsed_json = JSON.parse(response)

      parsed_json['Results']['series'][0]['data'].each do |rate|
         if month == rate['periodName']
            @unemp_rate = rate['value']
         end
      end

      if unemp_rate == 0
         puts 'Invalid data.'
      else
         puts "The unemployment rate in #{month} #{year} was #{unemp_rate}%."
      end
   end
end