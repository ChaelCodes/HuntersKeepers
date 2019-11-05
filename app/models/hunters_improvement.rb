# frozen_string_literal: true

# Improvements taken by the Hunter
# One is unlocked every 5 Experience
class HuntersImprovement < ApplicationRecord
  belongs_to :hunter
  belongs_to :improvement

  after_create :apply_improvement
  validate :validate_hunter, on: :create

  def apply_improvement
    if improvement.valid_hunter? hunter
      improvement.apply hunter
    else
      add_errors_from_improvement
      raise ActiveRecord::RecordInvalid
    end
  end

  def validate_hunter
    add_errors_from_improvement unless improvement.valid_hunter?(hunter)
  end

  def add_errors_from_improvement
    improvement.hunter_errors(hunter)&.each do |error|
      errors.add(:hunter, error)
    end
  end
end
