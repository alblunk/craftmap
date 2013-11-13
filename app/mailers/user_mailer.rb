class UserMailer < ActionMailer::Base
  default from: 'hi@farallon.co'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Farallon.')
  end
end
