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
  # This is for Improvements like "Add an option to your haven"
  class HavenMove < Improvement
    def apply(hunters_improvement)
      return false if add_errors(hunters_improvement)
      HuntersMove.create(hunter: hunters_improvement.hunter, move: move(hunters_improvement), haven: haven(hunters_improvement))
    end

    def add_errors(hunters_improvement)
      super(hunters_improvement)
      validate_hunter hunters_improvement
      validate_improvable hunters_improvement
      hunters_improvement.errors.present?
    end

    def validate_hunter(hunters_improvement)
      unless hunter_has_move?(hunters_improvement.hunter, move(hunters_improvement))
        return
      end
      hunters_improvement.errors.add(:hunter, "already has move with id #{move(hunters_improvement).id}") # rubocop:disable Metrics:LineLength
    end

    def validate_improvable(hunters_improvement); end

    def haven(hunters_improvement)
      Haven.find(hunters_improvement.improvable&.dig('haven', 'id'))
    rescue ActiveRecord::RecordNotFound => e
      hunters_improvement.errors.add(:improvable, e.message)
      false
    end

    def move(hunters_improvement)
      Move.find(hunters_improvement.improvable&.dig('move', 'id'))
    rescue ActiveRecord::RecordNotFound => e
      hunters_improvement.errors.add(:improvable, e.message)
      false
    end

    def hunter_has_move?(hunter, move)
      hunter.moves.include? move
    end

    def option_count
      1 # Flake gets 2 and a Haven
    end

    def improvable_options(hunter)
      moves = Move.where.not(id: hunter.moves.select(:id))
                  .haven
                  .select(:id, :name, :description)
      {
        move: { data: moves, count: option_count },
        haven: { data: Haven.all, count: 1 }
      }
    end
  end
end
