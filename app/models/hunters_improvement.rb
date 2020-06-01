# frozen_string_literal: true

# Improvements taken by the Hunter
# One is unlocked every 5 Experience
# == Schema Information
#
# Table name: hunters_improvements
#
#  id             :bigint           not null, primary key
#  hunter_id      :integer
#  improvement_id :integer
#  improvable     :jsonb
#
class HuntersImprovement < ApplicationRecord
  belongs_to :hunter
  belongs_to :improvement

  after_create :apply_improvement
  validate :validate_hunter, on: :create
  validates :improvement_id, uniqueness: { scope: :hunter_id }

  def apply_improvement
    raise ActiveRecord::RecordInvalid unless improvement.apply self
    hunter.gain_experience(-5)
  end

  def validate_hunter
    improvement.add_errors(self)
  end
end
