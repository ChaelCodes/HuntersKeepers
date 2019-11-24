# frozen_string_literal: true

class CreateMoves < ActiveRecord::Migration[5.2]
  def change
    create_table :moves do |t|
      t.string :name
      t.integer :rating
      t.string :six_and_under
      t.string :seven_to_nine
      t.string :ten_plus
      t.string :twelve_plus
      t.string :type

      t.timestamps
    end
  end
end
