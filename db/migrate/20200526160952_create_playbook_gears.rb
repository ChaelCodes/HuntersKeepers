class CreatePlaybookGears < ActiveRecord::Migration[6.0]
  def change
    create_table :playbook_gears do |t|
      t.references :playbook, null: false, foreign_key: true
      t.references :gear, null: false, foreign_key: true

      t.timestamps
    end
  end
end
