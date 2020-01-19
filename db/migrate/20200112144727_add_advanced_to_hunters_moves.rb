class AddAdvancedToHuntersMoves < ActiveRecord::Migration[5.2]
  def change
    add_column :hunters_moves, :advanced, :boolean
  end
end
