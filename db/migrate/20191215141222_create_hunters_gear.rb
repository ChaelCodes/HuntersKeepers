class CreateHuntersGear < ActiveRecord::Migration[5.2]
  def change
    create_table :hunters_gears do |t|
      t.references :hunter, foreign_key: true
      t.references :gear, foreign_key: true
    end
  end
end
