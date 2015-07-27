class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :category_bookmark, index: true, foreign_key: true
      t.references :bookmark, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
