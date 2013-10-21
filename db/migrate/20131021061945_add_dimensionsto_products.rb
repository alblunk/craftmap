class AddDimensionstoProducts < ActiveRecord::Migration
  def change
  	add_column :products, :dimensions, :string
  end
end
