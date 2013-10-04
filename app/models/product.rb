class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :brand, presence: true

  belongs_to :brand
  belongs_to :owner, class_name: "User"

  # other side of polymorphic images
  has_many :images, as: :imageable
  has_many :remote_datas
  accepts_nested_attributes_for :images, allow_destroy: true

  def has_images?
    images.count > 0
  end
end
