class AddArchivedAtToPlaybooks < ActiveRecord::Migration[6.0]
  def change
    add_column :playbooks, :archived_at, :datetime
  end
end
