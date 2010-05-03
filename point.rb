class Point
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def ==(point)
    return (x==point.x && y==point.y)
  end
end

