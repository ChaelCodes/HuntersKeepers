# frozen_string_literal: true

module Improves
  # Used to apply an Improvements::HavenMove to a hunter
  # if the hunter is a valid target
  class HavenMove < ImproveHunter
    include Improves::Moveable

    def initialize(hunters_improvement)
      super
      @move = move
      @haven = @improvement.configured_haven(@hunters_improvement)
    end

    def improve
      return false unless valid?
      HuntersMove.create(hunter: @hunter, move: @move, haven: @haven)
    end

    def valid?
      super
      check :not_haven_move?, :move, 'is not a haven option'
      check :hunter_move_exists?, :hunter,
            "already has move with id #{@move&.id}"
      @hunters_improvement.errors.none?
    end
  end
end
