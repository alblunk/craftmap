class Changepubliccolumninbrands < ActiveRecord::Migration
  def change
  	change_column :brands, :public, :string

  	rename_column :brands, :public, :public_information
  end
end
