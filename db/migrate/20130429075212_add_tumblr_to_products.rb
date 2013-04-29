class AddTumblrToProducts < ActiveRecord::Migration
  def change
    add_column :products, :tumblrbrand, :string
  end
end
