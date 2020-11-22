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
  # This improvement changes the hunters playbook
  class ChangePlaybook < Improvement
    def improvable_options(_hunter)
      playbooks = Playbook.where.not(id: playbook_id)
                          .select(:id, :name, :description)
      { playbook: { data: playbooks, count: 1 } }
    end
  end
end
