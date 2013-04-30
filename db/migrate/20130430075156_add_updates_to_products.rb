class AddUpdatesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :updates, :string
  end
end
