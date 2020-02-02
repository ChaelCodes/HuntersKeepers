class RemoveImprovableFromHuntersImprovements < ActiveRecord::Migration[6.0]
  def change
    remove_column :hunters_improvements, :improvable_type, :string
    remove_column :hunters_improvements, :improvable_id, :integer
  end
end
