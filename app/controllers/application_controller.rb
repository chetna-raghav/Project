class ApplicationController < ActionController::Base

	before_action :set_current_user
	def set_current_user
		if session[:user_id]
			# @user = User.find(session[:user_id])
			# @user = User.find_by(id: session[:user_id])
			Current.user = User.find_by(id: session[:user_id])
			
		elsif session[:busowner_id]
			# @user = User.find(session[:user_id])
			# @user = User.find_by(id: session[:user_id])
			Current.owner = Busowner.find_by(id: session[:busowner_id])
		end
	end
		
		
end
