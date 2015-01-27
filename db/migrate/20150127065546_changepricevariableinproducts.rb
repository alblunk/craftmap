class Changepricevariableinproducts < ActiveRecord::Migration
  change_column :products, :price, :string
end
