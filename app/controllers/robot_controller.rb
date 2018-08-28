class RobotController < ApplicationController

  def index
  end

  def play
    load_robot
  end

  def quit
    clear_session
    render :index
  end

  def run
    @robot = Robot.new(
      normalize_robot[:x],
      normalize_robot[:y],
      normalize_robot[:position],
      normalize_robot[:placed]
    )
    command, args = normalize_command
    if Command.is_valid?(command)
      if @robot.is_placed? || command == :place
        args ? @robot.send(command, args) : @robot.send(command)
        set_session
        flash[:success] = "#{settings_comand[:command]} is a valid command"
      else
        flash[:warn] = "You need first placed the robot. Please, use the command <b>PLACE</b>"
      end
    else
      flash[:error] = "#{settings_comand[:command]} is not a valid command"
    end

    @robot
    render "play"
  end

  private

  def normalize_robot
    {
      x: settings_robot[:x].to_i,
      y: settings_robot[:y].to_i,
      position: settings_robot[:position].to_sym,
      placed: settings_robot[:placed] == "true"
    }
  end

  def normalize_command
    args = settings_comand[:command].split
    [args[0].downcase.to_sym, args[1]]
  end

  def settings_robot
    params.permit(:x, :y, :position, :placed)
  end

  def settings_comand
    params.permit(:command)
  end

  def set_session
    [:x, :y, :position, :placed].each do |param|
      session[param] = @robot.try(param)
    end
  end

  def clear_session
    [:x, :y, :position, :placed].each do |param|
      session[param] = nil
    end
  end

  def load_robot
    @robot ||= begin
      if session[:x]
        Robot.new(session[:x], session[:y], session[:position], session[:placed])
      else
        Robot.new
      end
    end
  end

end
