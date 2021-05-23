# frozen_string_literal: true

module Improves
  # Methods supporting a Move-type Improvable
  # Supports a single Move or many Moves
  module Moveable
    def move
      @move ||=
        Move.find_by(id: @hunters_improvement.improvable&.dig('move', 'id'))
    end

    def moves
      @moves ||=
        Move.where(id:
          @hunters_improvement.improvable&.dig('moves')&.pluck('id'))
    end

    def valid?
      super
      check :invalid_move?, :move, 'not found'
    end

    # Check if moves are already advanced
    def already_advanced_moves?
      @hunter.hunters_moves.where(move: @moves).any?(&:advanced?)
    end

    # Check if move(s) have been found
    def invalid_move?
      @move.nil? && @moves.blank?
    end

    def hunter_move_exists?
      return false if invalid_move?
      return false if @move.type == 'Moves::Basic'
      # Check if the id is included in the current moves instead of comparing
      # the object since one move object may be 'Moves::Basic' and
      #  another move object may be 'Move' but they are the same
      @hunter.moves.pluck(:id).include?(@move.id)
    end

    def not_haven_move?
      return false if invalid_move?
      @move.present? && !@move.haven
    end

    # Checks any moves are not basic
    # relies on moves_count
    def not_basic_moves?
      @moves.where.not(type: 'Moves::Basic').count.positive?
    end

    def playbook_move_mismatch?
      return false if invalid_move?
      !playbook_move_match?
    end

    def playbook_move_match?
      return false if invalid_move?
      @improvement.playbook == @move.playbook
    end
  end
end
