class HomeworkMailer < ApplicationMailer
	 default from: "chris.lam@unt.edu"
  
  	def sample_email(submission_user, score, totalscore, assignment_name)
  		@submission_user = submission_user
  		@score = score
  		@totalscore = totalscore
  		@assignment_name = assignment_name
    	mail(to: submission_user.email, subject: 'An assignment has been graded!')
  end
end

