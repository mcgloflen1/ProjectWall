class PetitionsController < ApplicationController
	layout 'petitions'
	before_action :authenticate_user!, :only => [:new, :create]

	def index
		@college = College.find(params[:college_id])
		@petitions = @college.petitions.trending.paginate(:page => params[:page], :per_page => 10)
		@popular_tags = @college.petitions.all.tag_counts_on(:tags).limit(6)
	end

	def tag
		@college = College.find(params[:college_id])
		@popular_tags = @college.petitions.all.tag_counts_on(:tags).limit(6)
		@petitions = @college.petitions.popular.tagged_with(params[:name]).paginate(:page => params[:page], :per_page => 10)
	end

	def popular
		@college = College.find(params[:college_id])
		@petitions = @college.petitions.popular
	end

	def recent
		@college = College.find(params[:college_id])
		@petitions = @college.petitions.newest
	end

	def search
		@college = College.find(params[:college_id])
		@petitions = Petition.all
		@petitions_results = Petition.where("headline LIKE ? OR description LIKE ? OR recipient LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%")
	end

	def new
		@college = College.find(params[:college_id])
		@petition = Petition.new
	end

	def create
		@college = College.find(params[:college_id])
		@petition = @college.petitions.new(petition_params)
		@petition.user_id = current_user.id
		@petition.save

		if @petition.valid?
			redirect_to college_petitions_path
		else
			render :new
		end
	end

	def show
		@college = College.find(params[:college_id])
		@petition = @college.petitions.find(params[:id])
		@user = User.find(@petition.user_id)

		@ideas = @petition.ideas.newest.paginate(:page => params[:page], :per_page => 10)
		@alliances = @petition.alliances.newest
		@signatures = @petition.signatures.newest.limit(10)
	end

private
	def petition_params
		params.require(:petition).permit(:college_id, :user_id, :tag_list, :headline, :description, :recipient, :recipient_email, :goal, :anonymous)
	end
end