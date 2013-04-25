class AddBrandnameToProducts < ActiveRecord::Migration
  def change
    add_column :products, :brandname, :string
  end
end
