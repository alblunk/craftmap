class RenamePrimaryImageToLogo < ActiveRecord::Migration
  def change
    rename_column :brands, :primary_image, :logo
  end
end
