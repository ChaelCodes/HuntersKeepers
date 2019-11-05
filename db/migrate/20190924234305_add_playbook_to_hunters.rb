# frozen_string_literal: true

class AddPlaybookToHunters < ActiveRecord::Migration[5.2]
  def change
    add_reference :hunters, :playbook, foreign_key: true
  end
end
