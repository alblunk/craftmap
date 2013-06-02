class Product < ActiveRecord::Base
  attr_accessible :description, 
  :image, :image_remote_url, :ecomm_url, 
  :brandname, :productname, :pic1, :pic2, :pic3, :pic4, :pic5, 
  :location, :price, :brandpic, 
  :facebookbrand, :twitterbrand, :tumblrbrand, :instagrambrand, :productstatus, :founders,
  :updates, :profile, :details, :deliverdate



  validates :brandname, presence: true
  validates :productname, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates_attachment :image, presence: true,
                            content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                            size: { less_than: 5.megabytes }
  
  belongs_to :user
  has_attached_file :image, styles: { medium: "360x75^", large: "450x100^"}#, 220x100 (thumbnail) medium:"360x165^" #360x270/280x210 360x165

  def image_remote_url=(url_value)
  	self.image = URI.parse(url_value) unless url_value.blank?
  	super
  end
end
