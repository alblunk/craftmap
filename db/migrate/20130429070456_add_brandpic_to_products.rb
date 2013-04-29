class AddBrandpicToProducts < ActiveRecord::Migration
  def change
    add_column :products, :brandpic, :string
  end
end
