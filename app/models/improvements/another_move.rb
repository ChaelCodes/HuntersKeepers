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
