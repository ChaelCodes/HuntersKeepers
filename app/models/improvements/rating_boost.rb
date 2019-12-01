# frozen_string_literal: true

module Improvements
  # This is for Improvements like "Get +1 Weird, max +3"
  class RatingBoost < Improvement
    def apply(hunters_improvement)
      return false if add_errors(hunters_improvement)

      hunters_improvement.hunter.update_attribute(rating, hunters_improvement.hunter.send(rating) + 1)
    end

    def under_max_limit?(hunter)
      hunter.send(rating) < stat_limit
    end

    def add_errors(hunters_improvement)
      super
      hunter = hunters_improvement.hunter
      hunters_improvement.errors.add(:hunter, "#{rating} rating would exceed max for improvement.") unless under_max_limit? hunter
      return hunters_improvement.errors.present?
    end
  end
end
