class CreateHunters < ActiveRecord::Migration[5.2]
  def change
    create_table :hunters do |t|
      t.string :name
      t.integer :harm
      t.integer :luck
      t.integer :experience
      t.integer :charm
      t.integer :cool
      t.integer :sharp
      t.integer :tough
      t.integer :weird

      t.timestamps
    end
  end
end
