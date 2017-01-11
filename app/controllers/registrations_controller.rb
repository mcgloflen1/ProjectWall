class RegistrationsController < Devise::RegistrationsController

	def after_sign_up_path_for(resource)
		after_sign_in_path_for(resource)
	end
	
private
    def sign_up_params
        params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
    end

    def account_update_params
        params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :current_password, :associated_with, :streetaddress, :city, :state, :country, :zipcode, :language, :admin)
    end
end
