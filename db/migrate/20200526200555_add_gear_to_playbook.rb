# frozen_string_literal: true

class AddGearToPlaybook < ActiveRecord::Migration[6.0]
  def change
    add_column :playbooks, :available_gear, :integer, array: true
  end
end
