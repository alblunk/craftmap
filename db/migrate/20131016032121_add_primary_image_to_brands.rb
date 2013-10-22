class AddPrimaryImageToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :primary_image, :string
    add_column :brands, :original_filename, :string
  end
end
