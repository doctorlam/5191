# Preview all emails at http://localhost:3000/rails/mailers/homework_mailer
class HomeworkMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    HomeworkMailer.sample_email(User.first)
  end
end
