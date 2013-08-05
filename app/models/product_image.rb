class ProductImage < ActiveRecord::Base
  belongs_to :product

  has_attached_file :image, styles: { medium: "360x75^", large: "450x100^"}

  validates_attachment :image,  presence: true,
                                content_type: {
                                  content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']
                                },
                                size: { less_than: 5.megabytes }
end