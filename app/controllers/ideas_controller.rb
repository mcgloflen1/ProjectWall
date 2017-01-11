class IdeasController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@college = College.find(params[:college_id])
		@petition = Petition.find(params[:petition_id])
		@idea = @petition.ideas.new(idea_params)
		@idea.user_id = current_user.id
		@idea.save

		if @idea.valid?
			redirect_to college_petition_path(@college, @petition)
		else
			redirect_back(fallback_location: college_petition_path(@college, @petition))
		end
	end

private
	def idea_params
		params.require(:idea).permit(:petition_id, :user_id, :ideatext, :anonymous)
	end
end
