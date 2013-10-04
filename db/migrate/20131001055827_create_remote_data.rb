class CreateRemoteData < ActiveRecord::Migration
  def change
    create_table :remote_data do |t|
      t.integer :product_id
      t.string :slug
      t.boolean :default

      t.timestamps
    end
    add_index :remote_data, :product_id
  end
end
