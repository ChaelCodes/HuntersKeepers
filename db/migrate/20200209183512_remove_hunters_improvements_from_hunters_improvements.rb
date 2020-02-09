class RemoveHuntersImprovementsFromHuntersImprovements < ActiveRecord::Migration[6.0]
  def change

    remove_column :hunters_improvements, :hunters_improvements, :string
  end
end
