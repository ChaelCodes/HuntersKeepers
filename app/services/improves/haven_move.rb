# frozen_string_literal: true

module Improves
  # Used to apply an Improvements::HavenMove to a hunter
  # if the hunter is a valid target
  class HavenMove < ImproveHunter
    def initialize(hunters_improvement)
      super
      @move = @improvement.configured_move(@hunters_improvement)
      @haven = @improvement.configured_haven(@hunters_improvement)
    end

    def improve
      return false unless valid?
      HuntersMove.create(hunter: hunters_improvement.hunter, move: move(hunters_improvement), haven: haven(hunters_improvement))
    end

    def valid?
      super
      check :hunter_has_move?, :hunter, "already has move with id #{@move.id}"
      @hunters_improvement.errors.none?
    end

    def hunter_has_move?(hunter, move)
      hunter.moves.include? move
    end
  end
end
