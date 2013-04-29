class AddTwitterToProducts < ActiveRecord::Migration
  def change
    add_column :products, :twitterbrand, :string
  end
end
