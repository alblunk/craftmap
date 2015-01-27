class Removepercentage < ActiveRecord::Migration
  def change
  	remove_column :products, :percentage
  end
end
