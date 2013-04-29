class AddLocationtoProducts < ActiveRecord::Migration
def up
  	add_column :products, :location, :string
  end
end
