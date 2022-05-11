class AddcolumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :zip_code, :string
    add_column :users, :house_number, :string
    add_column :users, :profile, :text
  end
end
