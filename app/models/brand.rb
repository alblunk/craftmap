class Brand < ActiveRecord::Base
  validates :name, presence: true
  validates :profile, presence: true

  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  has_many :products, :dependent => :destroy

  has_one :profile_image, as: :imageable, :class_name => 'SecondaryImage'
  accepts_nested_attributes_for :profile_image, allow_destroy: true, :reject_if => lambda {|a| a['image'].blank?}

  mount_uploader :logo, ImageUploader

  def to_param
  	"#{id}-#{name.try(:parameterize)}"
  end

end
