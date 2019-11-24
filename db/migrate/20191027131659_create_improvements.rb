# frozen_string_literal: true

class CreateImprovements < ActiveRecord::Migration[5.2]
  def change
    create_table :improvements do |t|
      t.string :description
      t.string :type
      t.integer :rating
      t.integer :stat_limit
      t.references :playbook, foreign_key: true

      t.timestamps
    end
  end
end
