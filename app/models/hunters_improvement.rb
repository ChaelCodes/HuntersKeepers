# frozen_string_literal: true

# Improvements taken by the Hunter
# One is unlocked every 5 Experience
class HuntersImprovement < ApplicationRecord
  belongs_to :hunter
  belongs_to :improvement
  belongs_to :improvable, polymorphic: true, optional: true

  after_create :apply_improvement
  validate :validate_hunter, on: :create
  validates :improvement_id, uniqueness: { scope: :hunter_id }

  def apply_improvement
    unless improvement.apply self
      raise ActiveRecord::RecordInvalid
    end
    hunter.gain_experience(-5)
  end

  def validate_hunter
    improvement.add_errors(self)
  end
end
