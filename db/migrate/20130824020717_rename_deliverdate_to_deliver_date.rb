class RenameDeliverdateToDeliverDate < ActiveRecord::Migration
  def change
    rename_column :products, :deliverdate, :deliver_date
  end
end
