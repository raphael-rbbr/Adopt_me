class CreateAdoptions < ActiveRecord::Migration[6.1]
  def change
    create_table :adoptions do |t|
      t.references :pet
      t.references :user

      t.timestamps
    end
  end
end
