class SecondaryImage < ActiveRecord::Base

  belongs_to :imageable, polymorphic: true

  validates_presence_of :image

  mount_uploader :image, ImageUploader
end
