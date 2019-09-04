class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.references :playbook, foreign_key: true
      t.integer :charm
      t.integer :cool
      t.integer :sharp
      t.integer :tough
      t.integer :weird

      t.timestamps
    end
  end
end
