class CreateGears < ActiveRecord::Migration[5.2]
  def change
    create_table :gears do |t|
      t.string :name
      t.string :description
      t.integer :harm
      t.integer :armor
      t.references :playbook, foreign_key: true

      t.timestamps
    end
  end
end
