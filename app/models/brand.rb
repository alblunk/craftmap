class Brand < ActiveRecord::Base
  validates :name, presence: true
  validates :profile, presence: true

  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  has_many :products

  # other side of polymorphic images
  has_many :images, as: :imageable
  accepts_nested_attributes_for :images, allow_destroy: true, :reject_if => lambda {|a| a['image'].blank?}


end
