class AddPrimaryImageToProducts < ActiveRecord::Migration
  def change
    add_column :products, :primary_image, :string
    add_column :products, :original_filename, :string
  end
end
