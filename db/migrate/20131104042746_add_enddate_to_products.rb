class AddEnddateToProducts < ActiveRecord::Migration
  def change
    add_column :products, :end_date, :datetime
  end
end
