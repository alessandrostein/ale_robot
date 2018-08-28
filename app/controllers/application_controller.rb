class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :clear_flash_message

  private

  def clear_flash_message
    flash.clear
  end
end
