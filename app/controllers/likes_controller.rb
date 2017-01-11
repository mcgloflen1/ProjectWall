class LikesController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@college = College.find(params[:college_id])
		@petition = Petition.find(params[:petition_id])
		@idea = Idea.find(params[:idea_id])
		@like = @idea.likes.new(like_params)
		@like.user_id = current_user.id
		@like.save

		redirect_back(fallback_location: college_petition_path(@college, @petition))
	end

    def destroy
       	@college = College.find(params[:college_id])
		@petition = Petition.find(params[:petition_id])
		@idea = Idea.find(params[:idea_id])
		@like = @idea.likes.where(:user_id => current_user.id).first
        
        @like.destroy
        
        redirect_back(fallback_location: college_petition_path(@college, @petition))
    end

private
	def like_params
		params.require(:like).permit(:idea_id, :user_id, :yes, :anonymous)
	end
end
