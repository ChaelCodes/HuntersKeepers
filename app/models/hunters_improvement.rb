class HuntersImprovement < ApplicationRecord
  belongs_to :hunter
  belongs_to :improvement

  after_create :apply_improvement

  def apply_improvement
    if improvement.valid_hunter? hunter
      improvement.apply hunter
    else
      improvement.hunter_errors(hunter)&.each do |error|
        errors.add(:hunter, error)
      end
      raise ActiveRecord::RecordInvalid
    end
  end
end