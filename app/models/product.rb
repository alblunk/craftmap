class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates_presence_of :brand

  belongs_to :brand
  has_many :images, class_name: 'ProductImage'
  
  accepts_nested_attributes_for :brand, :images

end
