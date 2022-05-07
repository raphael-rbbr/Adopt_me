class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :species
      t.boolean :vaccinated
      t.text :description
      t.integer :age
      t.string :status

      t.timestamps
    end
  end
end
