class User < ActiveRecord::Base
  include Subscribable

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable

  has_many :brands, foreign_key: 'owner_id'
  has_many :products, foreign_key: 'owner_id'

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
