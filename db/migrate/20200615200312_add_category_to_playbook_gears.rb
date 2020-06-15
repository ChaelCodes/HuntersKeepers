class AddCategoryToPlaybookGears < ActiveRecord::Migration[6.0]
  def change
    add_column :playbook_gears, :category, :string
  end
end
