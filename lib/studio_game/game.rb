require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

module StudioGame
	class Game	
		attr_accessor :title, :player

		def initialize(title)
			@title = title
			@players = []
		end

		def add_player(player)
			@players << player
		end

		def total_points
	  		@players.reduce(0) { |sum, player| sum + player.points }
		end

		def play(rounds)
			#assigns TREASURES from treasure_love.rb to the new array treasures
			treasures = TreasureTrove::TREASURES 
			#prints the list of the treasure. 
			puts "\nThere are #{treasures.length} treasures hidden in the game:"
				treasures.each do |treasure|
			puts "#{treasure.name.capitalize} is worth #{treasure.points} points"
				end

			puts "\nThere are #{@players.size} players in #{@title}"
			@players.each do |player|
				puts player
			end
			puts "After playing the game: "
			1.upto(rounds) do |round|
				puts "\nRound #{round}"
				@players.each do |player|
					GameTurn.take_turn(player)
					puts player
				end
			end
		end

		def print_name_and_health(player)
			puts "#{player.name} (#{player.health})"
		end

		def high_score_entry(player)
			formatted_name = player.name.ljust(20, '.')
			"#{formatted_name} #{player.score}"
		end

		def print_stats
			strong_players, wimpy_players = @players.partition{|player| player.strong?}
			puts "\n #{@title} Statistics"
			puts 
			puts "#{strong_players.size} strong players: "
				strong_players.each do |player|
					print_name_and_health(player)
				end
			puts 
			puts "#{wimpy_players.size} wimpy players: " 
				wimpy_players.each do |player|
					print_name_and_health(player)
				end
			sorted_players = @players.sort
			puts 
			puts "Highest score of the game: "

			sorted_players.each do |sorted_player|
				puts high_score_entry(sorted_player)
			end

			@players.each do |player|
				puts "\n#{player.name}'s point totals: "
				puts "#{player.points} grand total points"
			end

			puts "#{total_points} total points from treasures found"

			@players.sort.each do |player|
				puts "\n#{player.name}'s point totals:"
				player.each_found_treasure do |treasure|
					puts "#{treasure.points} total #{treasure.name} points"
				end
				puts "#{player.points} grand total points"
			end

		end

		def load_players(from_file)
		    File.readlines(from_file).each do |line|
		    add_player(Player.from_csv(line))
		  end
		end

		def save_high_scores(to_file= "high_scores.txt")
			File.open(to_file, "w") do |file|
				file.puts "#{@title} High Scores: "
				@players.sort.each do |player|
					file.puts high_score_entry(player)
				end
			end
		end

	end

end