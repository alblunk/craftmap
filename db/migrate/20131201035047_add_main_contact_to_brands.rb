class AddMainContactToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :main_contact, :string
  end
end
