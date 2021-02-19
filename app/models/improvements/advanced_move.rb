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
  # This is for Improvements like "Mark two of the basic moves as advanced"
  class AdvancedMove < Improvement
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
