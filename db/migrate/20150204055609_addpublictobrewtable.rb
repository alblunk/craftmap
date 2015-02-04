class Addpublictobrewtable < ActiveRecord::Migration
  def change
  	add_column :brands, :public, :boolean

  	remove_column :products, :public
  end
end
