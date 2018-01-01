
module StudioGame	
#This will create a new struct once Tresure.new is called
	Treasure= Struct.new(:name, :points)

	module TreasureTrove
		#This is the array that holds list of treasures. 
		#Each element in the treasure is defined as an struct, 
		#that have name and point symbol
		TREASURES= [Treasure.new(:pie, 5),
					Treasure.new(:bottle, 25), 
					Treasure.new(:hammer, 50),
					Treasure.new(:skillet, 100),
					Treasure.new(:broomstick, 200),
					Treasure.new(:crowbar, 400)
					]

		def self.random
			TREASURES.sample
		end
	end
	#This method will print each element of array on the format below
	#Refactored method. Stays outside the module. 
	#def print_treasure(treasures)
	#	puts "\nThere are #{treasures.length} treasures hidden in the game:"
	#	treasures.each do |treasure|
	#		puts "#{treasure.name.capitalize} is worth #{treasure.points} points"
	#	end
	#end
end
