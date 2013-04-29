class AddPicture2toProducts < ActiveRecord::Migration
  def up
  	add_column :products, :pic2, :string
  end
end
