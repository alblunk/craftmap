class ApplicationController < ActionController::Base
  protect_from_forgery

  # before_filter :stealth_mode

 # Turned off to speed development up while no traffic exists

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

    def stealth_mode
      if Rails.env.production?
        redirect_to root_path unless request.path =~ /^\/$/
        return
      end
    end
end
