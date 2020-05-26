# frozen_string_literal: true

class RemoveAvailableGearsFromPlaybooks < ActiveRecord::Migration[6.0]
  def change
    remove_column :playbooks, :available_gear
  end
end
