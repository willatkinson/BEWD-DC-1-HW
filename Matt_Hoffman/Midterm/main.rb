require 'json'
require 'rest_client'
require_relative 'players.rb'
require_relative 'rounds.rb'


puts "Welcome to the movie name game!  What is your name, sir or madam?"
name = gets.chomp.capitalize
player = Players.new(name)

round = Rounds.new(player)
round.play

