class AddIndexForOwnerIdToBrands < ActiveRecord::Migration
  def change
    add_index :brands, :owner_id
  end
end
