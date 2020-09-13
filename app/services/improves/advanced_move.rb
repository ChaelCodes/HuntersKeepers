# frozen_string_literal: true

module Improves
  # Used to apply an Improvements::AdvancedMove to a hunter
  # if the hunter is a valid target
  class AdvancedMove < ImproveHunter
    include Improves::Moveable

    def initialize(hunters_improvement)
      super
      moves
      @count = 2
      @hunters_moves = HuntersMove.where(hunter: @hunter, move: @moves)
    end

    def improve
      return false unless valid?
      @hunters_moves.update(advanced: true)
    end

    def valid?
      super
      check :not_basic_moves?, :moves, 'are not all Basic'
      check :not_improvable_count?, :improvable, 'does not have 2 moves'
      check :already_advanced_moves?, :moves, 'already advanced'
      @hunters_improvement.errors.none?
    end

    def not_improvable_count?
      @improvable.dig('moves').count != @count
    end
  end
end
