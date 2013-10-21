class AddExistingLinetoProducts < ActiveRecord::Migration
  def change
  	add_column :products, :existingline, :boolean
  end
end
