# frozen_string_literal: true

module Improves
  # Used to apply an Improvements::Retire to a hunter
  # if the hunter is a valid target
  class Retire < ::ImproveHunter
    delegate :retired?, to: :@hunter

    def improve
      return false unless valid?
      @hunter.retire!
    end

    def valid?
      super
      check :retired?, :hunter,
            'is already retired'
      @hunters_improvement.errors.none?
    end
  end
end
