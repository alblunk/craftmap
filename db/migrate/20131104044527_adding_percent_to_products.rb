class AddingPercentToProducts < ActiveRecord::Migration
  def change
    add_column :products, :percentage, :integer
  end

end
