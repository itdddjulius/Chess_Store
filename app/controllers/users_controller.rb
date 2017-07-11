class UsersController < ApplicationController
	before_action :check_login, except: [:new, :create]
	before_action :check_not_login, only: [:new, :create]

	before_action :set_user, only: [:show, :edit, :update, :destroy]

	authorize_resource

	def index
		@users = User.all.to_a
	end

	def show
	end

	def employees
		@users = User.employees.active.to_a
	end

	def customers
		@users = User.customers.active.to_a
	end
	
	def new
		@user = User.new
	end

	def edit
	end

	def create
		@user = User.new(user_params)
		@user.role = "customer"
		if @user.save
			session[:user_id] = @user.id
			create_cart
			flash[:welcome] = true
			redirect_to home_path, notice: "Successfully created your account."
		else
			render action: 'new'
		end
	end

	def update
		if @user.update(user_params)
			redirect_to user_path(@user.id), notice: "Successfully updated user."
		else
			render action: 'edit'
		end
	end

	def dashboard
	end

	def destroy
		@user.destroy
		redirect_to home_path, notice: 'User inactivated.'
	end

	private
	def can_edit
		if @user == nil
			@user = User.find_by_id params[:id]
		end
		
		if current_user.role == 'admin'
			return true
		elsif current_user.role == 'manager' && @user.role == 'shipper'
			return true
		elsif current_user.id == @user.id
			return true
		else
			return false
		end
	end
	helper_method :can_edit

	def set_user
		if can_edit
			@user = User.find_by_id(params[:id])
		else
			@user = current_user
		end
	end
	def user_params
		params.require(:user).permit(:first_name, :last_name, :username, :phone, :email, :password, :password_confirmation)
	end
end