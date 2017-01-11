class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@colleges_admin = College.pending.oldest
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = current_user

        if @user.update_attributes(user_params)
        	redirect_to user_path(@user)
        else
        	render :edit
        end
	end

def user_params
		params.require(:user).permit(:firstname, :lastname, :associated_with, :streetaddress, :city, :state, :country, :zipcode, :language)
	end
end