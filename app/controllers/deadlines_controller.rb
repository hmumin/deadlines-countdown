class DeadlinesController < ApplicationController

	def new
		@deadline = current_user.deadlines.new
	end

	def create
		@deadline = current_user.deadlines.new(params[:deadline].permit(:title, :date, :description))
		if @deadline.save
			redirect_to @deadline
		else
			render 'new'
		end
	end

	def show
		@deadline = Deadline.find(params[:id])
	end

	def edit
		@deadline = current_user.deadlines.find(params[:id])
	end

	def index
		
		@deadlines = current_user.deadlines.all
		@deadlines = current_user.deadlines.order(:date).paginate(:page => params[:page], :per_page => 5)
	end

	def update
		@deadline = current_user.deadlines.find(params[:id])

		if @deadline.update(params[:deadline].permit(:title, :date, :description))
			redirect_to @deadline
		else
			render 'edit'
		end
	end

	def destroy
		@deadline = current_user.deadlines.find(params[:id])
		@deadline.destroy

		redirect_to deadlines_path

	end

	private
	def post_params
		params.require(:deadline).permit(:title, :date, :description)
	end
	
end
