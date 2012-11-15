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

  def next
    @current.shoot
    next_turn
  end
    
end

class Player
  attr_accessor :name, :shots
  
  def initialize(name)
    @name = name
    @shots = []
  end

  def shoot    
    @shots.push Shot.new
  end

end

class Shot
  attr_accessor :x, :y
  def initialize
    @y = [*1, 2].sample
    @x = [*1, 2, 3, 4].sample    
  end

end  