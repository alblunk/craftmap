class RemoveBrandAttributesFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :brandname, :string
    remove_column :products, :brandpic, :string
    remove_column :products, :founders, :string
    remove_column :products, :facebookbrand, :string
    remove_column :products, :instagrambrand, :string
    remove_column :products, :twitterbrand, :string
    remove_column :products, :tumblrbrand, :string
    remove_column :products, :location, :string
  end
end
