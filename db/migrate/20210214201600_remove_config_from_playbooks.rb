class RemoveConfigFromPlaybooks < ActiveRecord::Migration[6.0]
  def change
    remove_column :playbooks, :config, :jsonb
  end
end
