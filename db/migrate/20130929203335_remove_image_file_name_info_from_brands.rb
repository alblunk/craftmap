class RemoveImageFileNameInfoFromBrands < ActiveRecord::Migration
  def change
    remove_column :brands, :image_file_name, :string
    remove_column :brands, :image_content_type, :string
    remove_column :brands, :image_file_size, :integer
    remove_column :brands, :image_updated_at, :datetime
  end
end
