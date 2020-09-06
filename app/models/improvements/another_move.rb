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
