require './shootout.rb'  
require 'rspec'

describe Player do 
  
  it "should be initializable with name" do
    p = Player.new('human')
    p.name.should == 'human'     
  end  

  it "should be able to make shoot action" do
    p = Player.new('human')
    p.shoot
    p.shots.count.should == 1
  end 

end    