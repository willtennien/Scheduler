class ApplicationController < ActionController::Base
  protect_from_forgery
  def check_authentication notice
  	session[:intended_action] = current_action
  	session[:intended_controller] = current_controller
  	redirect_to new_session_path, notice: notice
  end
end
