class RemoveHuntersMovesFromHuntersMoves < ActiveRecord::Migration[6.0]
  def change
    remove_column :hunters_moves, :hunters_moves, :string
  end
end
