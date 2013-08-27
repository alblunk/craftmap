class AddLocationToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :location, :string
  end
end
