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
# Improvements are associated with Playbooks
# These are the options the Hunter can choose
# from when upgrading their character.
class Improvement < ApplicationRecord
  IMPROVEMENT_TYPES = %w[Improvement
                         Improvements::AdvancedMove
                         Improvements::AnotherMove
                         Improvements::ChangePlaybook
                         Improvements::GainLuck
                         Improvements::HavenMove
                         Improvements::PlaybookMove
                         Improvements::RatingBoost
                         Improvements::Retire].freeze

  belongs_to :playbook

  enum rating: { charm: 0, cool: 1, sharp: 2, tough: 3, weird: 4 }

  scope :advanced, -> { where(advanced: true) }
  scope :not_advanced, -> { where(advanced: [nil, false]) }

  validates :description, presence: true
  validates :type, inclusion: { in: IMPROVEMENT_TYPES }, allow_blank: true

  # Determines if a hunter is eligible for Advanced Improvements
  #
  # @param hunter [Hunter] check this hunter's eligiblity
  def self.advanced_eligible?(hunter)
    hunter.hunters_improvements.size >= 5
  end

  def apply(hunters_improvement)
    return false if add_errors(hunters_improvement)
    true
  end

  def hunter_playbook_matches?(hunter)
    hunter.playbook == playbook
  end

  def add_errors(hunters_improvement)
    hunter = hunters_improvement.hunter
    unless hunter_playbook_matches?(hunter)
      hunters_improvement
        .errors
        .add(:hunter, "does not match improvement playbook: #{playbook.name}")
    end

    return if !advanced || Improvement.advanced_eligible?(hunter)
    hunters_improvement
      .errors
      .add(:hunter, 'is not qualified for advanced improvements')
  end

  def improvable_options(_hunter)
    {}
  end
end
