class RemoveEcommUrlFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :ecomm_url, :string
  end
end
