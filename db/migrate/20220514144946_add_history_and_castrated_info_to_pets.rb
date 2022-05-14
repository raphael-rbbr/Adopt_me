class AddHistoryAndCastratedInfoToPets < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :history, :text
    add_column :pets, :castrated, :boolean
  end
end
