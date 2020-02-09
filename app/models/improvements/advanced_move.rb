# frozen_string_literal: true

module Improvements
  # This is for Improvements like "Mark two of the basic moves as advanced"
  class AdvancedMove < Improvement
    OPTIONS_COUNT = 2

    def apply(hunters_improvement)
      return false if add_errors(hunters_improvement)
      hunters_moves(hunters_improvement).update_all(advanced: true)
    end

    def add_errors(hunters_improvement)
      super(hunters_improvement)
      validate_hunter hunters_improvement
      validate_improvable hunters_improvement
      hunters_improvement.errors.present?
    end

    def validate_improvable(hunters_improvement)
      return if only_2_moves?(hunters_improvement)
      hunters_improvement.errors.add(:improvable, 'does not have 2 moves')
    end

    def validate_hunter(hunters_improvement)
      hunters_moves(hunters_improvement).each do |hunters_move|
        next unless hunters_move.advanced
        hunters_improvement
          .errors
          .add(:hunter, "already advanced move '#{hunters_move.move.name}'")
      end
    end

    def only_2_moves?(hunters_improvement)
      hunters_moves(hunters_improvement).count == 2
    end

    def hunters_moves(hunters_improvement)
      @hunters_moves ||= hunters_improvement
                         .hunter
                         .hunters_moves
                         .where(move_id: hunters_improvement.improvable.pluck('id'))
    end

    def improvable_options(hunter)
      Moves::Basic.joins(:hunters_moves)
                  .where(hunters_moves: { hunter_id: hunter.id, advanced: [false, nil] })
                  .select(:id, :name, :description)
    end

    def options_count
      Improvements::AdvancedMove::OPTIONS_COUNT
    end
  end
end
