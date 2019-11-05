# frozen_string_literal: true

# frozen_string_literal: true.

module Improvements
  # This is for Improvements like "Get +1 Weird, max +3"
  class RatingBoost < Improvement
    def apply(hunter)
      return false unless valid_hunter?(hunter)

      hunter.update_attribute(rating, hunter.send(rating) + 1)
    end

    def valid_hunter?(hunter)
      under_max_limit?(hunter)
    end

    def under_max_limit?(hunter)
      hunter.send(rating) < stat_limit
    end

    def hunter_errors(hunter)
      return unless under_max_limit?(hunter)

      errors = []
      errors << "#{rating} rating would exceed max for improvement."
    end
  end
end
