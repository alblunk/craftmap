class AddUsaBooleantoProducts < ActiveRecord::Migration
  def change
  	add_column :products, :usa, :boolean
  end
end
