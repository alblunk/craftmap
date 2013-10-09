class Admin::UsersController < Admin::BaseController

  def index
    @admins = User.admins.order(:id)
    @users = User.non_admins.order("created_at desc").page(params[:page]).per(25)
  end

  def update
    @user = User.find(params[:id]).update(user_params)

    redirect_to :back
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_users_path }
      format.json { head :no_content }
    end
  end

  private

    def user_params
      params.require(:user).permit(:admin)
    end

end
