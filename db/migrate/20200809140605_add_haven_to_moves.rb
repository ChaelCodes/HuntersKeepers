class AddHavenToMoves < ActiveRecord::Migration[6.0]
  def change
    add_column :moves, :haven, :boolean
  end
end
