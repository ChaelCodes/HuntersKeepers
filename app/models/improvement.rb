# frozen_string_literal: true

# Improvements are associated with Playbooks
# These are the options the Hunter can choose
# from when upgrading their character.
# == Schema Information
#
# Table name: improvements
#
# @!attribute id
#   @return []
# @!attribute advanced
#   @return [Boolean]
# @!attribute description
#   @return [String]
# @!attribute rating
#   @return [Integer]
# @!attribute stat_limit
#   @return [Integer]
# @!attribute type
#   @return [String]
# @!attribute created_at
#   @return [Time]
# @!attribute updated_at
#   @return [Time]
# @!attribute playbook_id
#   @return []
#
# Indexes
#
#  index_improvements_on_playbook_id  (playbook_id)
#
# Foreign Keys
#
#  fk_rails_...  (playbook_id => playbooks.id)
#
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

  def improvable_options(_hunter)
    {}
  end
end
