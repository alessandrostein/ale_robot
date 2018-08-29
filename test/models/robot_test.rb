require 'test_helper'

class RobotTest < ActiveSupport::TestCase

  test "initial state" do
    robot = Robot.new
    assert_equal(robot.is_placed?, false)
  end

  test "on the table" do
    robot = Robot.new
    robot.place("1,2,EAST")
    assert_equal(robot.is_placed?, true)
  end

end
