class NotificationsMailer < ActionMailer::Base

  # default :from => :email
  default :to => "pops@thebeeline.co"

  def new_message(message)
    @message = message
    mail(:subject => "Beeline Co. Help")
  end

end