class AddCeleryToProduct < ActiveRecord::Migration
  def change
    add_column :products, :ecomm_url, :string
  end
end
