class AddMaterialsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :materials, :text
  end
end
