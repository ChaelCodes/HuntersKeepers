# frozen_string_literal: true

module Improves
  # Used to apply an Improvements::RatingBoost to a hunter
  # if the hunter is a valid target
  class RatingBoost < ImproveHunter
    def initialize(hunters_improvement)
      super
      @rating = @improvement.configured_rating(@hunters_improvement)
    end

    def improve
      return false unless valid?
      rating = { @rating => @hunter.send(@rating) + 1 }
      @hunter.update(rating)
    end

    def valid?
      super
      check :over_max_limit?, :hunter,
            "#{@rating} rating would exceed max for improvement."
      @hunters_improvement.errors.none?
    end

    def over_max_limit?
      @hunter.send(@rating) >= @improvement.stat_limit
    end
  end
end
