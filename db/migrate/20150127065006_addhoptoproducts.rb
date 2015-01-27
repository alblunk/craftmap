class Addhoptoproducts < ActiveRecord::Migration
  def change
  	add_column :products, :hops, :text
  end
end
