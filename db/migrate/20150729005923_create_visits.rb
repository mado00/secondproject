class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :url
      t.string :time_amount

      t.timestamps null: false
    end
  end
end
