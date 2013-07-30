class Product < ActiveRecord::Base
  attr_accessible :description, :ecomm_url, :brandname, :productname,
  :location, :price, :brandpic, :facebookbrand, :twitterbrand, :tumblrbrand,
  :instagrambrand, :productstatus, :founders, :updates, :profile, :details, :deliverdate

  validates :brandname, presence: true
  validates :productname, presence: true
  validates :description, presence: true
  validates :user_id, presence: true

  belongs_to :user
  has_many :images, class_name: 'ProductImage'

end
