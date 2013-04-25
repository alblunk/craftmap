class AddProductnameToProducts < ActiveRecord::Migration
  def change
    add_column :products, :productname, :string
  end
end
