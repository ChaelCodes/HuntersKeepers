# frozen_string_literal: true

# == Schema Information
#
# Table name: moves
#
#  id            :bigint           not null, primary key
#  description   :string
#  haven         :boolean
#  name          :string
#  rating        :integer
#  seven_to_nine :string
#  six_and_under :string
#  ten_plus      :string
#  twelve_plus   :string
#  type          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  playbook_id   :bigint
#
# Indexes
#
#  index_moves_on_playbook_id  (playbook_id)
#
# Foreign Keys
#
#  fk_rails_...  (playbook_id => playbooks.id)
#
module Moves
  # used for Playbook moves that are purely test-based
  class Descriptive < Move
    def roll_results(_hunter)
      raise NotImplementedError
    end

    def rollable?
      false
    end
  end
end
