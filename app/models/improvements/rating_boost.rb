# frozen_string_literal: true

module Improvements
  # This is for Improvements like "Get +1 Weird, max +3"
  class RatingBoost < Improvement
    def apply(hunters_improvement)
      return false if add_errors(hunters_improvement)
      configured_rating = configured_rating(hunters_improvement)
      current_rating = hunters_improvement.hunter.send(configured_rating)
      hunters_improvement.hunter.update_attribute(configured_rating, current_rating + 1)
    end

    def under_max_limit?(hunters_improvement)
      hunters_improvement.hunter.send(configured_rating(hunters_improvement)) < stat_limit
    end

    def add_errors(hunters_improvement)
      super
      hunter = hunters_improvement.hunter
      hunters_improvement.errors.add(:hunter, "#{configured_rating(hunters_improvement)} rating would exceed max for improvement.") unless under_max_limit? hunters_improvement
      hunters_improvement.errors.present?
    end

    def improvable_options(_hunter)
      rating ? [] : Rating::LIST
    end

    def configured_rating(hunters_improvement)
      rating || hunters_improvement.improveable&.dig('improveable')
    end
  end
end
