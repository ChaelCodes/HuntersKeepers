class CreateImprovements < ActiveRecord::Migration[5.2]
  def change
    create_table :improvements do |t|
      t.string :description
      t.string :type
      t.integer :move_id
      t.integer :rating
      t.integer :stat_limit

      t.timestamps
    end
  end
end
