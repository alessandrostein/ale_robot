module Command

  AVAILABLES = [:place, :move, :left, :right, :report]

  def place(args)
    args = args.split(",")
    position_x = args[0].to_i
    @x = position_x > @table.width ? @table.width : position_x
    position_y = args[1].to_i
    @y = position_y > @table.height ? @table.height : position_y
    @position = args[2].downcase.to_sym
    @placed = true
  end

  def move
    case @position
    when :north # Move to up
      @y -= @y > 0 ? 1 : 0
    when :east # Move to right
      @x += @x < @table.width ? 1 : 0
    when :south # Move to down
      @y += @y < @table.height ? 1 : 0
    when :west # Move to left
      @x -= @x > 0 ? 1 : 0
    end
  end

  def left
    @position = Direction::AVAILABLES[
      Direction::AVAILABLES.index(@position) - 1
    ]
  end

  def right
    @position = Direction::AVAILABLES[
      Direction::AVAILABLES.index(@position) + 1
    ] || Direction::AVAILABLES[0]
  end
  
  def self.is_valid?(command)
    AVAILABLES.include?(command)
  end

end
