class Robot

  include Command

  attr_accessor :x, :y, :position, :placed, :table

  def initialize(x = 0, y = 0, position = Direction.default, placed = false, table = Tabletop.new)
    @x, @y, @position, @placed, @table = x, y, position, placed, table
  end

  def is_placed?
    @placed
  end  
end
