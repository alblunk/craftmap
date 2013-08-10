class DropUserIdOnProducts < ActiveRecord::Migration
  def change
    remove_column :products, :user_id, :integer
  end
end
