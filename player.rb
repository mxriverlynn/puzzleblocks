class Player
  attr_accessor :current_location

  def initialize(starting_location)
    @current_location = starting_location
  end

  def moveup
    current_location.y = @current_location.y - 1
  end

  def movedown
    current_location.y = @current_location.y + 1
  end

  def moveleft
    current_location.x = @current_location.x - 1
  end

  def moveright
    current_location.x = @current_location.x + 1
  end
end
