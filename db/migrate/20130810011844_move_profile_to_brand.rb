class MoveProfileToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :profile, :text
    remove_column :products, :profile, :text
  end
end
