class Image < ActiveRecord::Base

  belongs_to :imageable, polymorphic: true

  has_attached_file :image, styles: { small: "225x50^", medium: "360x80^", large: "450x100^"}


  # validates :file, file_size: { maximum: 5.megabytes.to_i }
end
