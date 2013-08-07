class RemoveImageAttributesFromProducts < ActiveRecord::Migration
  def up
    remove_column :products, :image_file_name
    remove_column :products, :image_content_type
    remove_column :products, :image_file_size
    remove_column :products, :image_updated_at
    remove_column :products, :image_remote_url
    remove_column :products, :pic1
    remove_column :products, :pic2
    remove_column :products, :pic3
    remove_column :products, :pic4
    remove_column :products, :pic5
  end

  def down
    add_column :products, :image_file_name, :string
    add_column :products, :image_content_type, :string
    add_column :products, :image_file_size, :integer
    add_column :products, :image_updated_at, :datetime
    add_column :products, :image_remote_url, :string
    add_column :products, :pic1, :string
    add_column :products, :pic2, :string
    add_column :products, :pic3, :string
    add_column :products, :pic4, :string
    add_column :products, :pic5, :string
  end
end
