class AddExistingUrLtoProducts < ActiveRecord::Migration
  def change
  	add_column :products, :existingurl, :string
  end
end
