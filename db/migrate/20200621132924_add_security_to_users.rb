class AddSecurityToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :banned_at, :datetime
    add_column :users, :confirmed_at, :datetime
  end
end
