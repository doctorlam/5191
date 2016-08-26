class PagesController < ApplicationController
  def about
  end

  def policies
  end

  def gradebook

  	if user_signed_in?
  	   @submissions = current_user.submissions
      @assignments = Assignment.order(deadline: :asc)
      @search = Submission.search(params[:q])
       @search.sorts = 'date' if @search.sorts.empty?
  	else 
  	redirect_to lessons_url
  end

end
end
