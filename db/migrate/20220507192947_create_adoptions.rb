class CreateAdoptions < ActiveRecord::Migration[6.1]
  def change
    create_table :adoptions do |t|
      t.references :pet, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
