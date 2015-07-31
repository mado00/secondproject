class AddSearchNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :search_name, :string
  end
end
