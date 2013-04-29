class AddPicture1toProducts < ActiveRecord::Migration
  def up
  	add_column :products, :pic1, :string
  end
end
