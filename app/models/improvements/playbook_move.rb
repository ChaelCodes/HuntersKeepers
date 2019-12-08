# frozen_string_literal: true

module Improvements
  # This is for Improvements like "Take another [Playbook] move"
  class PlaybookMove < Improvement
    def apply(hunters_improvement)
      return false if add_errors(hunters_improvement)

      hunters_improvement.hunter.moves << hunters_improvement.improvable
    end

    def add_errors(hunters_improvement)
      super(hunters_improvement)
      hunter = hunters_improvement.hunter
      move = hunters_improvement.improvable
      hunters_improvement.errors.add(:hunter, "already has move with id #{move.id}") if hunter_has_move?(hunter, move)
      hunters_improvement.errors.add(:improvable, 'is not a subclass of Move.') if not_a_move?(move)
      hunters_improvement.errors.add(:improvable, "is not from playbook #{playbook.name}") unless move_matches_playbook?(move)
      hunters_improvement.errors.present?
    end

    def move_matches_playbook?(move)
      move?(move) && move.playbook == playbook
    end

    def not_a_move?(move)
      !move?(move)
    end

    def move?(move)
      move.class <= Move
    end

    def hunter_has_move?(hunter, move)
      hunter.moves.include? move
    end
  end
end
