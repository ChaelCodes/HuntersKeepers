module Improvements
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
      errors = []
      unless under_max_limit?(hunter)
        errors << "#{rating} rating would exceed max for improvement."
      end
    end
  end
end