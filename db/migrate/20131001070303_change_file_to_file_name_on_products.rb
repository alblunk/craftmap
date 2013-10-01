class ChangeFileToFileNameOnProducts < ActiveRecord::Migration
  def change
    rename_column :images, :file, :filename
  end
end
