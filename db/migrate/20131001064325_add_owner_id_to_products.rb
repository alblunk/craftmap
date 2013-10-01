class AddOwnerIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :owner_id, :integer
  end
end
