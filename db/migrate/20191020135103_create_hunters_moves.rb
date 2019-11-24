# frozen_string_literal: true

class CreateHuntersMoves < ActiveRecord::Migration[5.2]
  def change
    create_table :hunters_moves do |t|
      t.string :hunters_moves
      t.references :hunter, foreign_key: true
      t.references :move, foreign_key: true
    end
  end
end
