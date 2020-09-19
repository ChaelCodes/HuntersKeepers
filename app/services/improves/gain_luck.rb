# frozen_string_literal: true

module Improves
  # Used to apply an Improvements::GainLuck to a hunter
  # if the hunter is a valid target
  class GainLuck < ::ImproveHunter
    def improve
      return false unless valid?
      @hunter.increment! :luck
    end

    def valid?
      super
      check :max_luck?, :hunter,
            'already has maximum luck'
      @hunters_improvement.errors.none?
    end

    def max_luck?
      @hunter.luck >= Hunter::MAX_LUCK
    end
  end
end
