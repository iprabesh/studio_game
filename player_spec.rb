require_relative 'player'
require 'rspec'

describe Player do

	before do
		@initial_health = 150
		@player = Player.new("larry", 150)
	end

	it "has a capitalized name" do
 		 @player.name.should == "Larry"
	end

	it "has an initial health" do
	  @player.health.should == 150
	end

	it "increases health by 15 when w00ted" do
	  @player.woot

	  @player.health.should == @initial_health + 15
	end

	it "decreases health by 10 when blammed" do
	  @player.blam
	  @player.health.should == @initial_health - 5
	end


context "with a health greater than 100" do
	before do
		@player = Player.new("larry", 150)
	end

	it "is strong" do
		@player.should be_strong
	end
end

context "with a health less then 100 or less" do
	before do 
		@initial_health = 100
		@player = Player.new("larry", @initial_health)
	end

	it "is wimpy" do
		@player.should_not be_strong
	end
end



end
