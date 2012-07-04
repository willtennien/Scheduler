class HomeController < ApplicationController
	def show
		session[:login_action] = "show"
		session[:login_controller] = "Home"

		respond_to do |f|
			f.html
		end
	end
end