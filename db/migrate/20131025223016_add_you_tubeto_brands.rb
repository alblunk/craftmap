class AddYouTubetoBrands < ActiveRecord::Migration
  def change
  	add_column :brands, :vid_youtube, :string
  end
end
