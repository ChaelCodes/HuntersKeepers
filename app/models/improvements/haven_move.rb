# frozen_string_literal: true

# == Schema Information
#
# Table name: improvements
#
# @!attribute id
#   @return []
# @!attribute advanced
#   @return [Boolean]
# @!attribute description
#   @return [String]
# @!attribute rating
#   @return [Integer]
# @!attribute stat_limit
#   @return [Integer]
# @!attribute type
#   @return [String]
# @!attribute created_at
#   @return [Time]
# @!attribute updated_at
#   @return [Time]
# @!attribute playbook_id
#   @return []
#
# Indexes
#
#  index_improvements_on_playbook_id  (playbook_id)
#
# Foreign Keys
#
#  fk_rails_...  (playbook_id => playbooks.id)
#
module Improvements
  # This is for Improvements like "Add an option to your haven"
  class HavenMove < Improvement
    def configured_haven(hunters_improvement)
      Haven.find(hunters_improvement.improvable&.dig('haven', 'id'))
    rescue ActiveRecord::RecordNotFound => e
      hunters_improvement.errors.add(:improvable, e.message)
      false
    end

    def configured_move(hunters_improvement)
      Move.find(hunters_improvement.improvable&.dig('move', 'id'))
    rescue ActiveRecord::RecordNotFound => e
      hunters_improvement.errors.add(:improvable, e.message)
      false
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
