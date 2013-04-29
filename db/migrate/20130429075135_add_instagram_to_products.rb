class AddInstagramToProducts < ActiveRecord::Migration
  def change
    add_column :products, :instagrambrand, :string
  end
end
