class AddCurrentNotesToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :current_notes, :text
  end
end
