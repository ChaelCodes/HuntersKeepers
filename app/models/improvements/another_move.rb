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
  # This is for Improvements like "Take a move from another playbook"
  class AnotherMove < Improvement
    def improvable_options(hunter)
      moves = Move.where.not(id: hunter.moves.select(:id))
                  .where.not(playbook_id: playbook_id)
                  .select(:id, :name, :description)
      { move: { data: moves, count: 1 } }
    end
  end
end
