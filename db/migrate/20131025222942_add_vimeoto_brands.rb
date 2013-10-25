class AddVimeotoBrands < ActiveRecord::Migration
  def change
  	add_column :brands, :vid_vimeo, :string
  end
end
