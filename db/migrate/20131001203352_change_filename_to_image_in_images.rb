class ChangeFilenameToImageInImages < ActiveRecord::Migration
  def change
    rename_column :images, :filename, :image
  end
end
