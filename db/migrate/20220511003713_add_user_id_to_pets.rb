class AddUserIdToPets < ActiveRecord::Migration[6.1]
  def change
    add_reference :pets, :user, index: true
  end
end
