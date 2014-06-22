class Rounds

	attr_accessor :movie, :player, :actor, :characters, :hash
		def initialize(player)
			@movie = nil
			@player = player
			@actor = nil
			@characters = nil
			@hash = nil
		end
	def play
		self.setmovie
		link = "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=xddq9kh7aja72877h7nwnz6z&q=#{@movie.downcase.gsub(' ', '%20')}&page_limit=1&page=1"
		@hash = JSON.parse(RestClient.get "#{link}")
		if @hash['total'] == 0
			puts "We can't seem to find a movie by that name.  Let's blame Auto Correct, shall we?\n\nLet's try again.\n"
			round = Rounds.new(@player)
			round.play
		else
			puts "Sweet!  #{@movie} is a great movie.  You have great taste in cinema, #{@player.name}.\n\nNow, here's a question to see how much you know about #{@movie}.\n\n"
			self.pluckdata
			puts "What was the name of the character played by #{@actor}?"
			response = gets.chomp.downcase
				if @characters.include?("#{response}")
					puts "Huzzah!  #{actor} did play #{response.split(" ").map(&:capitalize).join(" ")}."
				else
					puts "Alas, you guessed wrong.  #{actor} played #{@characters[0].split(" ").map(&:capitalize).join(" ")}."
				end
		end
	end

	def setmovie
		puts "Greetings, #{@player.name}!  What movie would you like to be quizzed about?"
		@movie = gets.chomp.split(" ").map(&:capitalize).join(" ")
	end

	def pluckdata
		@actor = hash['movies'][0]['abridged_cast'][0]['name']
		@characters = hash['movies'][0]['abridged_cast'][0]['characters'].map!{|c| c.downcase.strip}
	end

end