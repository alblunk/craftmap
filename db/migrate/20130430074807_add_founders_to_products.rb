class AddFoundersToProducts < ActiveRecord::Migration
  def change
    add_column :products, :founders, :string
  end
end
