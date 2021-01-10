class AddConfigToPlaybooks < ActiveRecord::Migration[6.0]
  def change
    add_column :playbooks, :config, :jsonb
  end
end
