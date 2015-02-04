class Changepubliccolumninbrands2 < ActiveRecord::Migration
  def change
  	rename_column :brands, :public, :public_information
  end
end
