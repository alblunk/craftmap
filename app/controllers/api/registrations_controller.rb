class Api::RegistrationsController < Api::BaseController

  def create
    user = User.new(user_params)

    if user.save
      render :json => { message: "Success! We'll notify you when we're ready to launch!" }, status: 201
    else
      render :json => user.errors, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end

end