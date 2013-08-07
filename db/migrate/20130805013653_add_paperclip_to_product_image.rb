class AddPaperclipToProductImage < ActiveRecord::Migration
  def change
    add_attachment :product_images, :image
  end
end
