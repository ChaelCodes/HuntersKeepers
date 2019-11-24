# frozen_string_literal: true

class CreateHuntersImprovements < ActiveRecord::Migration[5.2]
  def change
    create_table :hunters_improvements do |t|
      t.string :hunters_improvements
      t.integer :hunter_id
      t.integer :improvement_id
      t.references :improvable, polymorphic: true
    end
  end
end
