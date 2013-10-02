class AddOriginalFileNameToImages < ActiveRecord::Migration
  def change
    add_column :images, :original_filename, :string
  end
end
