class Image < ActiveRecord::Base

  belongs_to :imageable, polymorphic: true

  has_attached_file :image, styles: { small: "225x50^", medium: "360x80^", large: "450x100^"}


  validates_attachment :image,  presence: true,
                                content_type: {
                                  content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']
                                },
                                size: { less_than: 5.megabytes }
end
