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
  # This  class represents the basic moves that all Hunters have
  class Basic < Move
    def outcome(roll, hunter)
      case roll
      when 0..6
        six_and_under
      when 7..9
        seven_to_nine
      when 10..11
        ten_plus
      else
        hunter.advanced?(self) ? twelve_plus : ten_plus
      end
    end
  end
end
