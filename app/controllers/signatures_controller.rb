class SignaturesController < ApplicationController
	before_action :authenticate_user!

	def create
		@college = College.find(params[:college_id])
		@petition = Petition.find(params[:petition_id])
		@signature = @petition.signatures.new(signature_params)
		@signature.user_id = current_user.id
		@signature.save

		if @signature.valid?
			redirect_to college_petition_path(@college, @petition)
		else
			redirect_to college_petition_path(@college, @petition)
		end
	end

private
	def signature_params
		params.require(:signature).permit(:petition_id, :user_id, :comment, :anonymous)
	end
end
