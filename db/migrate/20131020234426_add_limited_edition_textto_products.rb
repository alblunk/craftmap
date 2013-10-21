class AddLimitedEditionTexttoProducts < ActiveRecord::Migration
  def change
  	add_column :products, :limitednumber, :string
  end
end
