class PagesController < ApplicationController
  def about
  end

  def policies
  end

  def gradebook
  	if user_signed_in?
  	 @submissions = current_user.submissions
  	else 
  	redirect_to lessons_url
  end
  
end
end
