class AddFounderstoBrand < ActiveRecord::Migration
  def change
  	add_column :brands, :founders, :string
  end
end
