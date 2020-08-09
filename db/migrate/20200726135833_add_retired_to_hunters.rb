class AddRetiredToHunters < ActiveRecord::Migration[6.0]
  def change
    add_column :hunters, :retired, :bool
  end
end
