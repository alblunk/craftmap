class Brand < ActiveRecord::Base
  validates :name, presence: true
  validates :profile, presence: true

  has_many :products
  # other side of polymorphic images
  has_many :images, as: :imagable#, dependent: :destroy
  accepts_nested_attributes_for :images

end
