class MigrationAddImageRemoteUrlToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :image_remote_url, :string
  end
end
