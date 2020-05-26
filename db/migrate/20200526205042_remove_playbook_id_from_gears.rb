# frozen_string_literal: true

class RemovePlaybookIdFromGears < ActiveRecord::Migration[6.0]
  def change
    remove_column :gears, :playbook_id, :bigint
  end
end
