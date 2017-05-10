class SchoolsController < ApplicationController
	autocomplete :school, :name, :full => true, :scopes => [:active], :extra_data => [:name, :street_1, :city, :state, :zip]
	before_action :check_login, only: [:show, :index, :new, :create]

	before_action :set_school, only: [:show, :edit, :update, :destroy]

	def show
	end

	def index
		@schools = School.all.to_a
	end

	def new
		@school = School.new
	end

	def create
		@school = School.new(school_params)
		if @school.save
			redirect_to school_path(@school.id)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @school.update_attributes(school_params)
			redirect_to school_path(@school.id)
		else
			render 'edit'
		end
	end


	def destroy
		@school.destroy
	end

	private
	def can_edit
		current_user.role == 'admin'
	end
	helper_method :can_edit

	def set_school
		@school =  School.find_by_id(params[:id])
	end
	def school_params
		params.require(:school).permit(:name, :street_1, :street_2, :city, :state, :zip, :min_grade, :max_grade)
	end

end