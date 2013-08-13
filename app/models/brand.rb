class Brand < ActiveRecord::Base
  validates :name, presence: true
  validates :profile, presence: true

  has_many :products
  has_attached_file :image, styles: { medium: "360x75^", large: "450x100^"}
end
