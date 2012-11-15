class Game
  attr_accessor :human, :computer, :current

  def initialize
    @human = Player.new('human')
    @computer = Player.new('computer')                
    @current = [*@human, @computer].sample
  end

  def whos_turn?
    @current
  end

  def next_turn
    @current = @current == @human ? @computer : @human
  end
    
end

class Player
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end

end