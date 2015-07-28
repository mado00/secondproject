class AddLogoToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :logo, :string
  end
end
