require_relative 'player'

module StudioGame

	class ClumsyPlayer < Player 
		attr_reader :boost_factor

		def initialize(name, health=100, boost_factor =1)
			super(name, health)
			@boost_factor = boost_factor
		end

		def woot
			@boost_factor.times {super}
		end

		#overriding found_treasure method for clumsy player. 
	  def found_treasure(treasure)
	  	damaged_treasure = Treasure.new(treasure.name, treasure.points/2.0)
	  	super(damaged_treasure)
	  end

	end

end
if __FILE__ == $0
clumsy = StudioGame::ClumsyPlayer.new("klutz")

hammer = StudioGame::Treasure.new(:hammer, 50)
clumsy.found_treasure(hammer)
clumsy.found_treasure(hammer)
clumsy.found_treasure(hammer)

crowbar = StudioGame::Treasure.new(:crowbar, 400)
clumsy.found_treasure(crowbar)

clumsy.each_found_treasure do |treasure|
	puts "#{treasure.points} total #{treasure.name} points"
end
	puts "#{clumsy.points} grand total points"
end