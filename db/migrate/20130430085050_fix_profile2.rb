class FixProfile2 < ActiveRecord::Migration
	def change
	change_column :products, :profile, :text, :limit => nil
	end
end