class Brand < ActiveRecord::Base
  has_many :products

  has_attached_file :image, styles: { medium: "360x75^", large: "450x100^"}
end
