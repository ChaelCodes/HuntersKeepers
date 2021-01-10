class CreateHunterBackstories < ActiveRecord::Migration[6.0]
  def change
    create_table :hunter_backstories do |t|
      t.references :hunter
      t.references :playbook
      t.jsonb :choices

      t.timestamps
    end
  end
end
