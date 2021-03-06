require_relative 'player'
require_relative 'die'
require_relative 'loaded_die'

module StudioGame
	module GameTurn
		def self.take_turn(player)
			die = Die.new
				case die.roll
					when 1..2
						player.blam
					when 3..4
						puts "#{player.name} was skipped."
					else
						player.woot
				end
				# This will provide the random treasure found by the player
				# during the game
				treasure = TreasureTrove.random
				#puts "#{player.name} found a #{treasure.name} worth #{treasure.points} points"
				player.found_treasure(treasure)
		end
	end
end