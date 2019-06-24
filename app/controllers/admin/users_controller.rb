class Admin::UsersController < ApplicationController
	before_action :admin_user

	def index
		@users = User.all.order(created_at: :asc)
	end

	def destroy
	    user = User.find(params[:id])
	    user.destroy
	    redirect_to admin_users_path
    end

end
