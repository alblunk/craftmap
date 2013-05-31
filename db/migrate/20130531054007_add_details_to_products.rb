class AddDetailsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :details, :text
  end
end
