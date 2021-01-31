class AddLuckEffectToPlaybooks < ActiveRecord::Migration[6.0]
  def change
    add_column :playbooks, :luck_effect, :string
  end
end
