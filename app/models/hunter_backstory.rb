# frozen_string_literal: true

# == Schema Information
#
# Table name: hunter_backstories
#
#  id          :bigint           not null, primary key
#  choices     :jsonb
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  hunter_id   :bigint
#  playbook_id :bigint
#
# Indexes
#
#  index_hunter_backstories_on_hunter_id    (hunter_id)
#  index_hunter_backstories_on_playbook_id  (playbook_id)
#
class HunterBackstory < ApplicationRecord
  belongs_to :hunter
  belongs_to :playbook

  # This is the Pundit Policy that governs HunterBackstory access
  #
  # @see HasHunterPolicy
  def self.policy_class
    HasHunterPolicy
  end
end
