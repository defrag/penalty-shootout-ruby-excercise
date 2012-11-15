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
    game.current.should_receive(:shoot).and_return(Shot.new)
    game.other_player.should_receive(:defend).and_return(Defend.new)
    game.should_receive(:next_turn)
    game.next
  end  

  it "should increment players score if shot was successfull" do
    game = Game.new
    
    defend = double("Defend", x:2, y:4)
    shot = double("Shot", x:1, y:2)
    
    game.current.should_receive(:shoot).and_return(shot)
    game.other_player.should_receive(:defend).and_return(defend)
    player = game.current

    game.next
    player.score.should == 1
  end  

  it "should not increment players score if shot was successfull" do
    game = Game.new
    
    defend = double("Defend", x:2, y:4)
    shot = double("Shot", x:2, y:4)
    
    game.current.should_receive(:shoot).and_return(shot)
    game.other_player.should_receive(:defend).and_return(defend)
    player = game.current

    game.next
    player.score.should == 0
  end  

  it "should not switch turns if game ended" do 
    game = Game.new
    game.stub(:ended?).and_return(true)            
    game.stub(:winner).and_return(Player.new('human'))            
    game.current.should_not_receive(:shoot)
    game.other_player.should_not_receive(:defend)
    game.next
  end  

end    