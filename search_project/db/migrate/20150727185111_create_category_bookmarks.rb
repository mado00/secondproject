class CreateCategoryBookmarks < ActiveRecord::Migration
  def change
    create_table :category_bookmarks do |t|
      t.string :name
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
