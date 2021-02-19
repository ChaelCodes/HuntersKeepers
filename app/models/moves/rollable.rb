# frozen_string_literal: true

# == Schema Information
#
# Table name: moves
#
# @!attribute id
#   @return []
# @!attribute description
#   @return [String]
# @!attribute haven
#   @return [Boolean]
# @!attribute name
#   @return [String]
# @!attribute rating
#   @return [Integer]
# @!attribute seven_to_nine
#   @return [String]
# @!attribute six_and_under
#   @return [String]
# @!attribute ten_plus
#   @return [String]
# @!attribute twelve_plus
#   @return [String]
# @!attribute type
#   @return [String]
# @!attribute created_at
#   @return [Time]
# @!attribute updated_at
#   @return [Time]
# @!attribute playbook_id
#   @return []
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
