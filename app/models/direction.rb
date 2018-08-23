class Direction
  AVAILABLES = [:north, :east, :south, :west]

  def self.default
    AVAILABLES[0]
  end
end
