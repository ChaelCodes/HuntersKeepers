# frozen_string_literal: true

# Improvements taken by the Hunter
# One is unlocked every 5 Experience
# == Schema Information
#
# Table name: hunters_improvements
#
#  id             :bigint           not null, primary key
#  improvable     :jsonb
#  hunter_id      :integer
#  improvement_id :integer
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

  # This is the Pundit Policy that governs HunterImprovement access
  #
  # @see HuntersImprovementPolicy
  def self.policy_class
    HuntersImprovementPolicy
  end
end
