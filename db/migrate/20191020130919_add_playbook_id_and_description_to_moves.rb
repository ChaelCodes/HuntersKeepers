# frozen_string_literal: true

class AddPlaybookIdAndDescriptionToMoves < ActiveRecord::Migration[5.2]
  def change
    add_reference :moves, :playbook, foreign_key: true
    add_column :moves, :description, :string
  end
end
