class FixUpdates2 < ActiveRecord::Migration
	def change
	change_column :products, :updates, :text, :limit => nil
	end
end
