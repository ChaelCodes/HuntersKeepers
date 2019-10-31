class AddPlaybookToImprovements < ActiveRecord::Migration[5.2]
  def change
    add_reference :improvements, :playbook, foreign_key: true
  end
end
