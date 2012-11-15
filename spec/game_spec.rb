require './shootout.rb'  
require 'rspec'

describe Game do 
  
  it "should initialize 2 players" do
    game = Game.new
    game.human.should be_instance_of(Player)
    game.computer.should be_instance_of(Player)
  end  

  it "should select which player starts shootout" do    
    game = Game.new
    game.current.should be_instance_of(Player)
  end  

  it "should shuffle turns" do    
    game = Game.new
    current = game.current
    game.next_turn
    game.current.should_not === current
    current = game.current
    game.next_turn
    game.current.should_not === current
  end

  it "should be able to perform next action" do
    game = Game.new
    game.current.should_receive(:shoot)
    game.should_receive(:next_turn)
    game.next
  end  

end    