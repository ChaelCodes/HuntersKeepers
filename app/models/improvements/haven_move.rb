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
