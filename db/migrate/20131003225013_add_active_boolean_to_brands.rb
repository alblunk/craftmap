class AddActiveBooleanToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :active, :boolean
  end
end
