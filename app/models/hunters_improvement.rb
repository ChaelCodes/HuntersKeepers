# frozen_string_literal: true

# Improvements taken by the Hunter
# One is unlocked every 5 Experience
# == Schema Information
#
# Table name: hunters_improvements
#
# @!attribute id
#   @return []
# @!attribute improvable
#   @return [Hash]
# @!attribute hunter_id
#   @return [Integer]
# @!attribute improvement_id
#   @return [Integer]
#
class HuntersImprovement < ApplicationRecord
  belongs_to :hunter
  belongs_to :improvement

  after_create :apply_improvement
  validate :validate_hunter, on: :create
  validates :improvement_id, uniqueness: { scope: :hunter_id }

  def apply_improvement
    unless ImproveHunter.for(improvement).new(self).improve
      raise ActiveRecord::RecordInvalid
    end
    hunter.gain_experience(-5)
  end

  def validate_hunter
    ImproveHunter.for(improvement).new(self).valid?
  end
end
