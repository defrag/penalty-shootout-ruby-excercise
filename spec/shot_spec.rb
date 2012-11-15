require './shootout.rb'  
require 'rspec'

describe Shot do 
  
  it "should be random" do
    10.times do #make sure random couple of times
      s = Shot.new
      s.y.should be_between(1, 2)
      s.x.should be_between(1, 4)
    end        
  end  

end    