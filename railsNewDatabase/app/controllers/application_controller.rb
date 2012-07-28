class ApplicationController < ActionController::Base
  protect_from_forgery
  def check_authentication *maybe_user, notice, &block
  	unless ((m = maybe_user[0]) ? session[:user_id] == m.id : session[:user_id])
	  	session[:intended_controller] = controller_name
	  	session[:intended_action] = action_name
	  	redirect_to new_session_path, notice: notice
	  	return nil
  	else
  		if block 
  			block.call
  		else
  			return true
  		end
  	end
  end
end
