class ChangeProductColumnNames < ActiveRecord::Migration
  def change
    rename_column :products, :features, :grain_bill
    rename_column :products, :materials, :abv
    rename_column :products, :dimensions, :ibu
    rename_column :products, :description, :tasting_notes

    add_column :products, :style, :string


    remove_column :products, :deliver_date
    remove_column :products, :limitednumber
    remove_column :products, :updates
    remove_column :products, :details
    remove_column :products, :end_date

  end
end
