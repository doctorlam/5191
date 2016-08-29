class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    before_filter :check_user, only: [:edit, :update, :destroy, :show]

	def index
		if user_signed_in?
			@users = User.order('name ASC')
			@submissions = Submission.all
	
	else
        redirect_to root_url, alert: "You don't have permission to do that!"
	end
end
	

end
