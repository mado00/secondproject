class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :name
      t.string :url
      t.text :description
      t.string :image
      t.string :map_url

      t.timestamps null: false
    end
  end
end
