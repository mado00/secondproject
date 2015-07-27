class CreateCateoryBookmarks < ActiveRecord::Migration
  def change
    create_table :cateory_bookmarks do |t|
      t.string :name
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
