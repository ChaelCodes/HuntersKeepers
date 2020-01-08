class AddUserToHunters < ActiveRecord::Migration[5.2]
  def change
    add_reference :hunters, :user, foreign_key: true
  end
end
