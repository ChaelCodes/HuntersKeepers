class Improvement < ApplicationRecord
  IMPROVEMENT_TYPES = %w[Improvement Improvements::RatingBoost]

  enum rating: { charm: 0, cool: 1, sharp: 2, tough: 3, weird: 4 }

  def apply(hunter)
  end

  def valid_hunter?(hunter)
    hunter.present?
  end

  def hunter_errors(hunter)
    # Add any validation errors in an array
    []
  end
end
