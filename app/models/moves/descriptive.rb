# frozen_string_literal: true

module Moves
  # used for Playbook moves that are purely test-based
  class Descriptive < Move
    def roll_results(_hunter)
      raise NotImplementedError
    end

    def rollable?
      false
    end
  end
end
