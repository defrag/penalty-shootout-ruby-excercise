class Game
  attr_accessor :human, :computer, :current, :other_player, :log, :winner

  def initialize
    @human = Player.new('human')
    @computer = Player.new('computer')                
    @current = [*@human, @computer].sample
    @log = []
    @winner = nil
  end

  def whos_turn?
    @current
  end

  def next_turn
    @current = @current === @human ? @computer : @human
  end

  def other_player
    @current === @human ? @computer : @human
  end

  def next
    return if ended?
    shot = @current.shoot    
    defense = other_player.defend
    check_shot(shot, defense)    
    next_turn if not ended?
  end
   
  def check_shot(shot, defense)        

    if shot.x == defense.x and shot.y == defense.y
      @log << "#{current.name} is shooting but #{other_player.name} saves the day!" 
      #handle defense  
    else  
      @log << "#{current.name} scooores!" 
      @current.made_goal
    end        
  end

  def ended?
    ended = false
    if @current.shots.size >= 5 #5 penalties
      if @current.score > other_player.score
        if @current.score - other_player.score >= 2
          ended = true
          @winner = @current
        end  
      elsif @current.score < other_player.score 
        if other_player.score - @current.score >= 2
          ended = true
          @winner = other_player
        end  
      end        
    end      
    ended
  end
    
end

class Player
  attr_accessor :name, :shots, :defences, :score
  
  def initialize(name)
    @score = 0
    @name = name
    @shots = []
    @defences = []
  end

  def shoot    
    shot = Shot.new
    @shots << shot    
    shot
  end

  def defend    
    defense = Defend.new
    @defences << defense
    defense
  end

  def made_goal
    @score += 1
  end

end

class Shot
  attr_accessor :x, :y
  def initialize
    @y = [*1, 2].sample
    @x = [*1, 2, 3, 4].sample    
  end

end  

class Defend < Shot
end
