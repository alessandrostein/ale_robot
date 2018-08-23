class Robot

  include Command

  attr_accessor :x, :y, :position, :table

  def initialize(x = 0, y = 0, position = Direction.default, table = Tabletop.new)
    @x, @y, @position, @table = x, y, position, table
  end
end
