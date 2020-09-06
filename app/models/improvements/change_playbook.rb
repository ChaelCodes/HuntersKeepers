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
  # This improvement changes the hunters playbook
  class ChangePlaybook < Improvement
    def apply(hunters_improvement)
      return false if add_errors(hunters_improvement)

      hunters_improvement
        .hunter
        .update(playbook: new_playbook(hunters_improvement))
    end

    def add_errors(hunters_improvement)
      super(hunters_improvement)
      unless playbook?(new_playbook(hunters_improvement))
        hunters_improvement
          .errors
          .add(:improvable, 'is not a Playbook.')
      end
      hunters_improvement.errors.present?
    end

    def playbook?(playbook)
      playbook.class <= Playbook
    end

    def new_playbook(hunters_improvement)
      Playbook.find(hunters_improvement.improvable&.dig('playbook', 'id'))
    rescue ActiveRecord::RecordNotFound => e
      hunters_improvement.errors.add(:improvable, e.message)
    end

    def improvable_options(_hunter)
      playbooks = Playbook.where.not(id: playbook_id).select(:id, :name, :description)
      { playbook: { data: playbooks, count: 1 } }
    end
  end
end
