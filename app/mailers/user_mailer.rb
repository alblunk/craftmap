class UserMailer < ActionMailer::Base
  default from: 'info@farllon.co'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Farallon')
  end
end
