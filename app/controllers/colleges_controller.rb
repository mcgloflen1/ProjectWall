class CollegesController < ApplicationController
	before_action :authenticate_user!, :except => [:index]

	def index
		@colleges_results = College.approved.where("name LIKE ? OR city LIKE ? OR state LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%")

		@colleges = College.approved.paginate(:page => params[:page], :per_page => 10)
	end

	def new
		@college = College.new
	end

	def create
		@college = College.create(college_params)

		if @college.valid?
			redirect_to colleges_path
		else
			render :new
		end
	end

	def edit
		if current_user.admin?
			@college = College.find(params[:id])
		end
	end

	def update
		if current_user.admin?
			@college = College.find(params[:id])

			if @college.update_attributes(college_params)
	        	redirect_to user_path(current_user.id)
	        else
	        	render :edit
	        end
	    end
	end

	def destroy
		if current_user.admin?
			@college = College.find(params[:id])
	        @college.destroy
	        
	        redirect_to user_path(current_user.id)
	    end
	end

private
	def college_params
		params.require(:college).permit(:name, :city, :state, :country, :college_approval, :created_by)
	end

end


