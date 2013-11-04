class RenamePercentToProducts < ActiveRecord::Migration
  def change
    rename_column :products, :percent, :integer
  end
end
