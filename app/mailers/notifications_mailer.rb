class NotificationsMailer < ActionMailer::Base

  default :from => "no-reply@thebeeline.co"
  default :to => "pops@thebeeline.co"

  def new_message(message)
    @message = message
    mail(:subject => "Beeline Co. Help")
  end

end