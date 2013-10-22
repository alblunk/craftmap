class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :brand, presence: true

  belongs_to :brand
  belongs_to :owner, class_name: "User"

  has_many :secondary_images, as: :imageable
  has_many :remote_datas
  accepts_nested_attributes_for :secondary_images, allow_destroy: true, :reject_if => lambda {|a| a['image'].blank?}

  mount_uploader :primary_image, ImageUploader

  def has_images?
    images.count > 0
  end

  def to_param
    "#{id}-#{name.try(:parameterize) }"
  end
end
