class PagesController < ApplicationController
  def about
  end

  def policies
  end

  def gradebook
  	 @submissions = current_user.submissions
  end
end
