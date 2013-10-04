class AddSocialLinksToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :facebook,    :string
    add_column :brands, :twitter,     :string
    add_column :brands, :instagram,   :string
    add_column :brands, :tumblr,      :string
    add_column :brands, :home_page,   :string
  end
end
