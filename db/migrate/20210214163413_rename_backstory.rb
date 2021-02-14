class RenameBackstory < ActiveRecord::Migration[6.0]
  def change
    add_column :playbooks, :backstory, :jsonb
  end
end
