class RobotController < ApplicationController

  def index

  end

  def play
    @robot = Robot.new
  end

  def run
    flash.clear
    @robot = Robot.new(
      settings_robot[:x].to_i,
      settings_robot[:y].to_i,
      settings_robot[:position].to_sym
    )
    command, args = settings_comand[:command].split
    if Command.is_valid?(command)
      args ? @robot.send(command.downcase, args) : @robot.send(command.downcase)
      flash[:success] = "#{settings_comand[:command]} is a valid command"
    else
      flash[:error] = "#{settings_comand[:command]} is not a valid command"
    end

    @robot
    render "play"
  end

  private

  def settings_robot
    params.permit(:x, :y, :position)
  end

  def settings_comand
    params.permit(:command)
  end

end
