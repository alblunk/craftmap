class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :brand, presence: true

  belongs_to :brand
  has_many :images, class_name: 'ProductImage'
  
  accepts_nested_attributes_for :images, reject_if: :all_blank

end
