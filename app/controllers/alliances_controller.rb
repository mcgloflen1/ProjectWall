class AlliancesController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@college = College.find(params[:college_id])
		@petition = Petition.find(params[:petition_id])
		@alliance = @petition.alliances.new(alliance_params)
		@alliance.user_id = current_user.id
		@alliance.save

		if @alliance.valid?
			redirect_to college_petition_path(@college, @petition)
		else
			redirect_to college_petition_path(@college, @petition)
		end
	end

private
	def alliance_params
		params.require(:alliance).permit(:petition_id, :user_id, :note, :anonymous)
	end
end
