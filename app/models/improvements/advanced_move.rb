# frozen_string_literal: true

# == Schema Information
#
# Table name: improvements
#
#  id          :bigint           not null, primary key
#  advanced    :boolean
#  description :string
#  rating      :integer
#  stat_limit  :integer
#  type        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  playbook_id :bigint
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
