# frozen_string_literal: true

# == Schema Information
#
# Table name: hunters_improvements
#
#  id             :bigint           not null, primary key
#  improvable     :jsonb
#  hunter_id      :integer
#  improvement_id :integer
#
# Improvements taken by the Hunter
# One is unlocked every 5 Experience
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
