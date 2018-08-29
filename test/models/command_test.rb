require 'test_helper'

class CommandTest < ActiveSupport::TestCase

  setup do
    @robot = Robot.new
  end

  test "valid command" do
    assert Command.is_valid?(:move)
  end

  test "invalid command" do
    assert_equal(Command.is_valid?(:turn_left), false)
  end

  test "place" do
    @robot.place("3,4,NORTH")
    assert_equal(@robot.x, 3)
    assert_equal(@robot.y, 4)
    assert_equal(@robot.position, :north)
  end

  test "move" do
    @robot.place("3,4,NORTH")
    @robot.move
    assert_equal(@robot.x, 3)
    assert_equal(@robot.y, 3)
    assert_equal(@robot.position, :north)
  end

  test "left" do
    @robot.place("3,4,NORTH")
    @robot.left
    assert_equal(@robot.x, 3)
    assert_equal(@robot.y, 4)
    assert_equal(@robot.position, :west)
  end

  test "right" do
    @robot.place("3,4,NORTH")
    @robot.right
    assert_equal(@robot.x, 3)
    assert_equal(@robot.y, 4)
    assert_equal(@robot.position, :east)
  end

end
