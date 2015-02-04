class Addpublictobreweriestable < ActiveRecord::Migration
  def change
  	add_column :products, :public, :boolean
  end
end
