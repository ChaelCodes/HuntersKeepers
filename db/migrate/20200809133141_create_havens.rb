# frozen_string_literal: true

class CreateHavens < ActiveRecord::Migration[6.0]
  def change
    create_table :havens do |t|
      t.string :name
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
