class AddAdvancedToImprovements < ActiveRecord::Migration[5.2]
  def change
    add_column :improvements, :advanced, :boolean
  end
end
