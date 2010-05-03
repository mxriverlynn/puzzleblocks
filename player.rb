class Player
  attr_accessor :block_one, :block_two

  def initialize(starting_location)
    @block_one = Point.new(starting_location.x, starting_location.y)
    @block_two = Point.new(starting_location.x, starting_location.y)
  end

  def moveup
    ymod_1 = 1
    ymod_1 = 2 if @block_one == @block_two
    ymod_2 = 1
    ymod_2 = 2 if @block_one != @block_two

    block_one.y = @block_one.y - ymod_1
    block_two.y = @block_two.y - ymod_2
  end

  def movedown
    ymod_1 = 1
    ymod_1 = 2 if @block_one == @block_two
    ymod_2 = 1
    ymod_2 = 2 if @block_one != @block_two

    block_one.y = @block_one.y + ymod_1
    block_two.y = @block_two.y + ymod_2
  end

  def moveleft
    xmod_1 = 1
    xmod_1 = 2 if @block_one == @block_two
    xmod_2 = 1
    xmod_2 = 2 if @block_one != @block_two
    
    block_one.x = @block_one.x - xmod_1
    block_two.x = @block_two.x - xmod_2 
  end

  def moveright
    xmod_1 = 1
    xmod_1 = 2 if @block_one == @block_two
    xmod_2 = 1
    xmod_2 = 2 if @block_one != @block_two
    
    block_one.x = @block_one.x + xmod_1
    block_two.x = @block_two.x + xmod_2 
  end

  def on_point(column, row)
    checkpoint = Point.new(column, row)
    on1 = (@block_one == checkpoint)
    on2 = (@block_two == checkpoint)
    return on1 || on2
  end
end
