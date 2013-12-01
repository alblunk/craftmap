class AddFulfillmentContactToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :fulfillment_contact, :string
  end
end
