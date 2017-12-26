require_relative 'player'
require_relative 'game'
#require_relative 'die'


player1 = Player.new("moe")
player2 = Player.new("curly", 200)
player3 = Player.new("larry", 150)

game1 = Game.new("Knuckleheads")

game1.add_player(player1)
game1.add_player(player2)
game1.add_player(player3)

game1.play(4)

game1.print_stats

