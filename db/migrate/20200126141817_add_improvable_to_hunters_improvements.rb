class AddImprovableToHuntersImprovements < ActiveRecord::Migration[6.0]
  def change
    add_column :hunters_improvements, :improveable, :jsonb
  end
end
