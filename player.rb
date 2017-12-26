class Player

	attr_accessor :name, :health

	def initialize(name = "no-name-by-default", health = 150)
		@name = name.capitalize
		@health = health			
	end

	def to_s
		"I'm #{@name} with a health of #{@health}."
	end

	def woot
		@health+=15
	end

	def blam
		@health-=5
	end

	def strong?
		@health >=150 ? true : false
	end
end

if __FILE__ == $0
  player = Player.new("moe")
  puts player.name
  puts player.health
  player.woot
  puts player.health
  player.blam
  puts player.health
end