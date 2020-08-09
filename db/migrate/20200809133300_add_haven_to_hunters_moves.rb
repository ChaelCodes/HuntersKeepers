# frozen_string_literal: true

class AddHavenToHuntersMoves < ActiveRecord::Migration[6.0]
  def change
    add_reference :hunters_moves, :haven, index: { where: 'haven_id IS NOT NULL' }, foreign_key: true
  end
end
