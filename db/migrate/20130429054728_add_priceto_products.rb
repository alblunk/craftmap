class AddPricetoProducts < ActiveRecord::Migration
def up
  	add_column :products, :price, :integer
  end
end
