class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :brand, presence: true

  belongs_to :brand
  # other side of polymorphic images
  has_many :images, as: :imagable, dependent: :destroy


end
