class UsersController < ApplicationController
	before_action :check_login, except: [:new, :create]
	before_action :check_not_login, only: [:new, :create]


	def new
		@user = User.new
	end

	def edit
		@user = current_user
	end

	def create
		@user = User.new(user_params)
		@user.role = "customer"
		if @user.save
			session[:user_id] = @user.id
			redirect_to home_path, notice: "Successfully created your account."
		else
			render action: 'new'
		end
	end

	def update
		@user = current_user
		if @user.update(user_params)
			redirect_to home_path, notice: "Successfully updated user."
		else
			render action: 'edit'
		end
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :username, :phone, :email, :password, :password_confirmation)
	end
end