class Api::RegistrationsController < Api::BaseController

  skip_before_filter :stealth_mode

  def create
    user = User.new(user_params)

    if user.save
      UserMailer.delay.welcome_email(user)
      render :json => { message: "Success! We'll notify you when we're ready to launch!" }, status: 201
    else
      render :json => { errors: user.errors }, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end

end