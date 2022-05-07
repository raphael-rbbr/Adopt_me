class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :sender, foreign_key: true
      t.references :receiver, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
