class Product < ActiveRecord::Base
  belongs_to :brand
  belongs_to :owner, class_name: "User"

  has_many :secondary_images, as: :imageable
  has_one :remote_data
  accepts_nested_attributes_for :secondary_images, allow_destroy: true, :reject_if => lambda {|a| a['image'].blank?}
  accepts_nested_attributes_for :remote_data, allow_destroy: true

  validates :name, presence: true
  validates :brand, presence: true

  mount_uploader :primary_image, ImageUploader

  def has_secondary_images?
    secondary_images.count > 0
  end

  def to_param
    "#{id}-#{name.try(:parameterize) }"
  end
end
