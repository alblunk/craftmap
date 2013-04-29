class AddFacebookToProducts < ActiveRecord::Migration
  def change
    add_column :products, :facebookbrand, :string
  end
end
