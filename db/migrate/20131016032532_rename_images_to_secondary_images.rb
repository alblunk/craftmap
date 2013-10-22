class RenameImagesToSecondaryImages < ActiveRecord::Migration
  def change
    rename_table :images, :secondary_images
  end
end
