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
