class Product < ActiveRecord::Base
  validates :brandname, presence: true
  validates :productname, presence: true
  validates :description, presence: true
  validates :user_id, presence: true

  belongs_to :user
  has_many :images, class_name: 'ProductImage'
  accepts_nested_attributes_for :images

end
