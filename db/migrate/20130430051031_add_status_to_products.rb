class AddStatusToProducts < ActiveRecord::Migration
  def change
    add_column :products, :productstatus, :string
  end
end
