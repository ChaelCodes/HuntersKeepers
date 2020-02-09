class RenameImproveableOnHuntersImprovements < ActiveRecord::Migration[6.0]
  def change
    rename_column :hunters_improvements, :improveable, :improvable
  end
end
