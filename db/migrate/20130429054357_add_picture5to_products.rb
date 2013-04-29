class AddPicture5toProducts < ActiveRecord::Migration
  def up
  	add_column :products, :pic5, :string
  end
end
