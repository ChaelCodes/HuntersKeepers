# frozen_string_literal: true

# Improvements are associated with Playbooks
# These are the options the Hunter can choose
# from when upgrading their character.
class Improvement < ApplicationRecord
  IMPROVEMENT_TYPES = %w[Improvement Improvements::RatingBoost].freeze

  belongs_to :playbook

  enum rating: { charm: 0, cool: 1, sharp: 2, tough: 3, weird: 4 }

  validates :description, presence: true
  validates :type, inclusion: { in: IMPROVEMENT_TYPES }, allow_blank: true

  def apply(hunter); end

  def valid_hunter?(hunter)
    hunter.present?
  end

  def hunter_errors(_hunter)
    # Add any validation errors in an array
    []
  end
end
