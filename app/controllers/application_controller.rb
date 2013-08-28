class ApplicationController < ActionController::Base
  protect_from_forgery

  def admin?
    current_user? && current_user.admin?
  end

  def current_user?
    user_signed_in?
  end

  private

    def require_admin
      authenticate_user!

      unless admin?
        redirect_to root_path
      end
    end
end
