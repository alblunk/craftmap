class AddPercentToProducts < ActiveRecord::Migration
  def change
    add_column :products, :percent, :integar
  end
end
