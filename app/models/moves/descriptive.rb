# frozen_string_literal: true

# == Schema Information
#
# Table name: moves
#
#  id            :bigint           not null, primary key
#  name          :string
#  rating        :integer
#  six_and_under :string
#  seven_to_nine :string
#  ten_plus      :string
#  twelve_plus   :string
#  type          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  playbook_id   :bigint
#  description   :string
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
