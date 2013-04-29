class AddPicture4toProducts < ActiveRecord::Migration
 def up
  	add_column :products, :pic4, :string
  end
end
