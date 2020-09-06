# frozen_string_literal: true

# == Schema Information
#
# Table name: improvements
#
#  id          :bigint           not null, primary key
#  description :string
#  type        :string
#  rating      :integer
#  stat_limit  :integer
#  playbook_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  advanced    :boolean
#
module Improvements
  # This is for Improvements like "Mark two of the basic moves as advanced"
  class AdvancedMove < Improvement
    def apply(hunters_improvement)
      return false if add_errors(hunters_improvement)
      hunters_moves(hunters_improvement).update_all(advanced: true)
    end

    def add_errors(hunters_improvement)
      super(hunters_improvement)
      validate_improvable hunters_improvement
      validate_hunter hunters_improvement if hunters_improvement.errors.blank?
      hunters_improvement.errors.present?
    end

    def validate_improvable(hunters_improvement)
      unless only_2_moves?(hunters_improvement)
        hunters_improvement.errors.add(:improvable, 'does not have 2 moves')
      end
      return if basic_moves?(hunters_improvement)
      hunters_improvement.errors.add(:improvable, 'moves are not basic.')
    end

    def validate_hunter(hunters_improvement)
      move_ids(hunters_improvement).each do |move_id|
        hunters_move = hunters_improvement.hunter
                                          .hunters_moves
                                          .find_or_create_by(move_id: move_id)
        next unless hunters_move.advanced
        hunters_improvement
          .errors
          .add(:hunter, "already advanced move '#{hunters_move.move.name}'")
      end
    end

    def basic_moves?(hunters_improvement)
      move_ids = move_ids(hunters_improvement)
      Moves::Basic.where(id: move_ids).count == move_ids.count
    end

    def only_2_moves?(hunters_improvement)
      move_ids(hunters_improvement).count == 2
    end

    def hunters_moves(hunters_improvement)
      @hunters_moves ||= hunters_improvement
                         .hunter
                         .hunters_moves
                         .where(move_id: move_ids(hunters_improvement))
    end

    def move_ids(hunters_improvement)
      hunters_improvement.improvable.dig('moves').pluck('id')
    end

    def improvable_options(hunter)
      moves = Moves::Basic
              .joins("LEFT JOIN hunters_moves ON \
                moves.id = hunters_moves.move_id AND hunter_id = #{hunter.id}")
              .where(hunters_moves: { advanced: [false, nil] })
              .select(:'moves.id', :name, :description)
      { moves: { data: moves, count: 2 } }
    end
  end
end
