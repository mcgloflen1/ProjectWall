class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_filter :store_location

  	def store_location
	    # store last url as long as it isn't a /users path
	    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
	end

	def after_sign_in_path_for(resource)
		if current_user.admin?
 			user_path(current_user)
 		else
 			session[:previous_url] || root_path
 		end
	end

	def after_sign_out_path_for(resource)
		new_user_session_path
	end
end
