# frozen_string_literal: true

# == Schema Information
#
# Table name: improvements
#
#  id          :bigint           not null, primary key
#  description :string
#  type        :string
#  rating      :integer
#  stat_limit  :integer
#  playbook_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  advanced    :boolean
#
class Improvement < ApplicationRecord
  OPTIONS_COUNT = 1
  IMPROVEMENT_TYPES = %w[Improvement Improvements::RatingBoost
                         Improvements::PlaybookMove Improvements::AnotherMove
                         Improvements::ChangePlaybook Improvements::GainLuck
                         Improvements::AdvancedMove].freeze

  belongs_to :playbook

  enum rating: { charm: 0, cool: 1, sharp: 2, tough: 3, weird: 4 }

  scope :not_advanced, -> { where(advanced: [nil, false]) }

  validates :description, presence: true
  validates :type, inclusion: { in: IMPROVEMENT_TYPES }, allow_blank: true

  def apply(hunters_improvement)
    return false if add_errors(hunters_improvement)
    true
  end

  def hunter_playbook_matches?(hunter)
    hunter.playbook == playbook
  end

  def add_errors(hunters_improvement)
    hunter = hunters_improvement.hunter
    return if hunter_playbook_matches?(hunter)
    hunters_improvement.errors.add(:hunter, "does not match improvement playbook: #{playbook.name}")
  end

  def improvable_options(_hunter)
    []
  end

  def options_count
    Improvement::OPTIONS_COUNT
  end
end
