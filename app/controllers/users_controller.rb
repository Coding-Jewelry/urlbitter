class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
	end

	def new
		@user = User.new(user_params)
	end

	def create
		@user = User.new(firstName: params[:firstName], lastName: params[:lastName], email: params[:email],
						password: params[:password], password_confirmation: params[:password_confirmation])

		if @user.save
		  slug = Array.new(32){rand(36).to_s(36)}.join + "&" + @user.id.to_s
		  @user.update(slug: slug)
		  render :json => { success: 1, error: 0 }
		else
		  render :json => { success: 0, error: 1, errors: @user.errors }
		end
	end

	private


	def user_params
		params.permit(:firstName, :lastName, :email, :password,
                                   :password_confirmation)
	end
end
