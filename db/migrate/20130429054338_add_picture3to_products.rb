class AddPicture3toProducts < ActiveRecord::Migration
  def up
  	add_column :products, :pic3, :string
  end
end
