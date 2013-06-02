class AddingDeliverdateToProducts < ActiveRecord::Migration
  def up
    add_column :products, :deliverdate, :string
  end
end
