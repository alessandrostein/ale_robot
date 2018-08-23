class Tabletop

  DEFAULT_WIDTH = 4
  DEFAULT_HEIGHT = 4

  attr_accessor :width, :height, :position

  def initialize(width = DEFAULT_WIDTH, height = DEFAULT_HEIGHT)
    @width, @height = width, height
  end
end
