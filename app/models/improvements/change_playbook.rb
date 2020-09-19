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
    def improvable_options(_hunter)
      playbooks = Playbook.where.not(id: playbook_id)
                          .select(:id, :name, :description)
      { playbook: { data: playbooks, count: 1 } }
    end
  end
end
