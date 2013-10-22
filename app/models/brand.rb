class Brand < ActiveRecord::Base
  validates :name, presence: true
  validates :profile, presence: true

  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  has_many :products

  has_many :secondary_images, as: :imageable
  accepts_nested_attributes_for :secondary_images, allow_destroy: true, :reject_if => lambda {|a| a['image'].blank?}

  mount_uploader :primary_image, ImageUploader

  def to_param
  	"#{id}-#{name.try(:parameterize)}"
  end
end
