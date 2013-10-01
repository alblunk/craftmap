class AddIndexForOwnerIdToProducts < ActiveRecord::Migration
  def change
    add_index :products, :owner_id
  end
end
