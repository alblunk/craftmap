class AddIndexToProductModel < ActiveRecord::Migration
  def change
    add_index :products, :brand_id
  end
end
