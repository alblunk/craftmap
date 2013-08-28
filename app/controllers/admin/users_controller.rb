class Admin::UsersController < Admin::BaseController

  def index
    @admins = User.admins.order(:id)
    @users = User.non_admins.order(:id).page(params[:page])
  end

  def update
    @user = User.find(params[:id]).update(user_params)
    
    redirect_to :back
  end

  private

    def user_params
      params.require(:user).permit(:admin)
    end

end