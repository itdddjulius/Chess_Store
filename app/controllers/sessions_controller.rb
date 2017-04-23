class SessionsController < ApplicationController
	include ChessStoreHelpers::Cart

	def new
	end

	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			create_cart
			redirect_to home_path, notice: "Logged in!"
		else
			flash.now.alert = "Email or password is invalid"
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		destroy_cart
		redirect_to home_path, notice: "Logged out!"
	end
end