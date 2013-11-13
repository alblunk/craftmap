class User < ActiveRecord::Base
  include Subscribable

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable

  has_many :brands, foreign_key: 'owner_id'
  has_many :products, foreign_key: 'owner_id'

  after_create :send_welcome_message

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

  def send_welcome_message
    UserMailer.delay.welcome_email(self)
  end

end
