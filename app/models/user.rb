class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, #:recoverable
         :rememberable, :trackable, :validatable

  def self.admins
    where(admin: true)
  end

  def self.non_admins
    where(admin: false)
  end

  private

  # Override Devise method to allow new Users to be created without a password.
  def password_required?
    if new_record?
      !(password.blank? && password_confirmation.blank?)
    else
      super
    end
  end
end
