class Brand < ActiveRecord::Base
  validates :name, presence: true
  validates :profile, presence: true

  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  has_many :products
  # other side of polymorphic images
  has_many :images, as: :imagable#, dependent: :destroy
  accepts_nested_attributes_for :images

end
