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
  # This class is use for rollable moves that are not basic moves
  class Rollable < Move
    include ::Rollable
  end
end
