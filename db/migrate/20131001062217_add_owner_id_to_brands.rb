class AddOwnerIdToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :owner_id, :integer
  end
end
