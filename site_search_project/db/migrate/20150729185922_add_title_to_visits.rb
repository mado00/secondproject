class AddTitleToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :title, :string
  end
end
