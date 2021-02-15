# frozen_string_literal: true

# Gear is equipment that the Hunter can use.
# It is provided by the Playbook.
# == Schema Information
#
# Table name: gears
#
# @!attribute id
#   @return []
# @!attribute armor
#   @return [Integer]
# @!attribute description
#   @return [String]
# @!attribute harm
#   @return [Integer]
# @!attribute name
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
#  index_gears_on_playbook_id  (playbook_id)
#
# Foreign Keys
#
#  fk_rails_...  (playbook_id => playbooks.id)
#
class Gear < ApplicationRecord
  belongs_to :playbook
  validates :name, presence: true
  acts_as_taggable
end
