class RenameProductAttributes < ActiveRecord::Migration
  def change
    rename_column :products, :productname, :name
    rename_column :products, :productstatus, :status
  end
end
